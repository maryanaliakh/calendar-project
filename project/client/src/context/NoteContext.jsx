import React, { createContext, useState, useEffect } from "react";

export const NoteContext = createContext();

export function NoteProvider({ children }) {
    const [notes, setNotes] = useState([]);
    const [doneNotes, setDoneNotes] = useState([]);
    const [isClickDeleteBut, setIsClickDeleteBut] = useState([]);
    const [inProgress, setInProgress] = useState([]);

    useEffect(() => {
        fetch(`http://localhost:1234/notes`)
            .then(res => res.json())
            .then(data => setNotes(data))
            .catch(err => console.error(err));
    }, []);

    useEffect(() => {
        let storedDone = localStorage.getItem("doneNotes");
        if (storedDone) setDoneNotes(JSON.parse(storedDone));

        let storedDeleted = localStorage.getItem("deletedNotes");
        if (storedDeleted) setIsClickDeleteBut(JSON.parse(storedDeleted));
    }, []);

    const getDataFromForm = (month, day, contentNote) => {
        const body = { note: contentNote };
        return fetch(`http://localhost:1234/notes/${month}/${day}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body),
        })
            .then(res => {
                if (!res.ok) throw new Error("Network error");
                return res.json();
            })
            .then(data => {
                return fetch(`http://localhost:1234/notes`)
                    .then(res => res.json())
                    .then(allNotes => {
                        setNotes(allNotes);
                    });
            })
            .catch(err => console.error(err));
    };

    const refreshNotes = () => {
        fetch(`http://localhost:1234/notes`)
            .then(res => res.json())
            .then(data => setNotes(data))
            .catch(err => console.error("Error refreshing notes:", err));
    };

    const changeStatus = (noteId, updatedDelete, updatedDoneNotes, updatedInProgress) => {
        const body = {
            isClickDeleteBut: updatedDelete,
            doneNotes: updatedDoneNotes,
            inProgress: updatedInProgress,
        };
        return fetch(`http://localhost:1234/notes`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body),
        }).catch(console.error);
    };

    const deleteNote = (noteId) => {
        let updatedDoneNotes = [...doneNotes];
        let updatedInProgress = [...inProgress];
        let updatedDelete;

        if (isClickDeleteBut.includes(noteId)) {
            updatedDelete = isClickDeleteBut.filter((id) => id !== noteId);
        } else {
            updatedInProgress = updatedInProgress.filter((id) => id !== noteId);
            updatedDoneNotes = updatedDoneNotes.filter((id) => id !== noteId);
            updatedDelete = [...isClickDeleteBut, noteId];
        }
        changeStatus(noteId, updatedDelete, updatedDoneNotes, updatedInProgress);
        setIsClickDeleteBut(updatedDelete);
        setDoneNotes(updatedDoneNotes);
        setInProgress(updatedInProgress);

        localStorage.setItem("doneNotes", JSON.stringify(updatedDoneNotes));
        localStorage.setItem("deletedNotes", JSON.stringify(updatedDelete));

        setNotes((prev) => prev.filter((note) => note.id !== noteId));
    };

    const handleCheckboxToggle = (noteId) => {
        const isDone = doneNotes.includes(noteId);

        let updatedDoneNotes = isDone
            ? doneNotes.filter((id) => id !== noteId)
            : [...doneNotes, noteId];

        let updatedInProgress = isDone
            ? [...inProgress, noteId]
            : inProgress.filter((id) => id !== noteId);

        let updatedDelete = isClickDeleteBut.filter((id) => id !== noteId);

        setDoneNotes(updatedDoneNotes);
        setInProgress(updatedInProgress);
        setIsClickDeleteBut(updatedDelete);

        localStorage.setItem("doneNotes", JSON.stringify(updatedDoneNotes));
        localStorage.setItem("deletedNotes", JSON.stringify(updatedDelete));

        changeStatus(noteId, updatedDelete, updatedDoneNotes, updatedInProgress);
    };

    return (
        <NoteContext.Provider
            value={{
                notes,
                doneNotes,
                isClickDeleteBut,
                inProgress,
                getDataFromForm,
                deleteNote,
                handleCheckboxToggle,
                setNotes,
                refreshNotes
            }}
        >
            {children}
        </NoteContext.Provider>
    );
}
