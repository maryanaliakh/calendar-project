import React,  { useContext } from "react";
import { NoteContext } from "../../context/NoteContext.jsx";
import "./FormForAddNote.css";

function FormForAddNote({ indexMonth, onClose, setIsNotes }) {
    const { refreshNotes } = useContext(NoteContext);
    const getDataFromForm = (event) => {
        event.preventDefault();

        const contentNote = event.target.note.value.trim();
        const date = event.target.date.value;

        if (!contentNote || !date) return;

        const formatDate = new Date(date);
        const month = formatDate.getMonth() + 1;
        const day = formatDate.getDate();

        const body = {
            note: contentNote,
            date: formatDate.toISOString()
        };

        fetch(`http://localhost:1234/notes/${month}/${day}`, {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        })
            .then(res => {
                if (!res.ok) {
                    return res.text().then(text => {
                        throw new Error("Server error:\n" + text);
                    });
                }
                return res.json();
            })
            .then(() => {
                refreshNotes();
                event.target.reset();

                if (setIsNotes) {
                    fetch('http://localhost:1234/notes/')
                        .then(res => res.json())
                        .then(data => {
                            const filtered = data.filter(note => {
                                const d = new Date(note.date);
                                return d.getMonth() === indexMonth && d.getFullYear() === 2025;
                            });
                            setIsNotes(filtered);
                        })
                        .catch(console.error);
                }
                onClose();
            })
            .catch(err => {
                console.error(err);
            });
    };

    return (
        <form className="custom-form" onSubmit={getDataFromForm}>
            <input
                id="note"
                name="note"
                placeholder="Your note..."
                className="form-input"
                autoComplete="off"
            />

            <input
                type="datetime-local"
                name="date"
                id="date"
                defaultValue={new Date().toISOString().slice(0, 16)}
                className="form-input"
            />

            <button type="submit" className="form-button">
                Add
            </button>
        </form>
    );
}

export default FormForAddNote;
