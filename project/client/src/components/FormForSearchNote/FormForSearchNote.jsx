import React, { useState } from 'react';
import { useNavigate } from "react-router-dom";
import './FormForSearchNote.css';

function FormForSearchForm({ notes }) {
    const [userText, setUserText] = useState('');
    const [suggestionNote, setSuggestionNote] = useState([]);
    const navigate = useNavigate();

    const handleInputChange = (e) => {
        const text = e.target.value;
        setUserText(text);

        if (text.trim() === '') {
            setSuggestionNote([]);
            return;
        }

        const filterNotes = notes.filter(note =>
            note.notes.toLowerCase().includes(text.toLowerCase())
        );
        setSuggestionNote(filterNotes);
    };

    const handleSelect = (note) => {
        const date = new Date(note.date);
        const day = date.getDate();
        const month = date.getMonth() + 1;

        setUserText('');
        setSuggestionNote([]);

        navigate(`/notes/${month}/${day}`);
    };

    return (
        <div className="search-note-container">
            <input
                type="text"
                value={userText}
                onChange={handleInputChange}
                placeholder="Search note..."
                className="search-note-input"
            />

            {suggestionNote.length > 0 && (
                <ul className="search-note-suggestions">
                    {suggestionNote.map(note => {
                        const date = new Date(note.date);
                        const day = date.getDate();
                        const month = date.getMonth() + 1;
                        const year = date.getFullYear();
                        const dayStr = day < 10 ? '0' + day : day;
                        const monthStr = month < 10 ? '0' + month : month;

                        return (
                            <li
                                key={note.id}
                                onClick={() => handleSelect(note)}
                                className="search-note-item"
                            >
                                <span className="search-note-text">{note.notes}</span>
                                <span className="search-note-date">
                                    {dayStr}-{monthStr}-{year}
                                </span>
                            </li>
                        );
                    })}
                </ul>
            )}
        </div>
    );
}

export default FormForSearchForm;
