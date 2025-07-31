import React, { useContext, useEffect} from "react";
import { useParams} from "react-router-dom";
import { motion } from "framer-motion";
import { nameMonth } from "../PageYear/Year.jsx";
import FormForSearchForm from "../../components/FormForSearchNote/FormForSearchNote.jsx";
import Arrow from "../../image/button-arrow.png";
import IconPlus from "../../components/IconPlus/IconPlus.jsx";
import IconBasket from "../../components/IconBasket/IconBasket.jsx";
import { NoteContext } from "../../context/NoteContext.jsx";
import CloseButton from "../../image/button-close.png";
import "./Notes.css";

function Notes() {
    const { month, day } = useParams();
    const {
        notes,
        doneNotes,
        isClickDeleteBut,
        getDataFromForm,
        deleteNote,
        handleCheckboxToggle,
    } = useContext(NoteContext);

    const formatDay = (elementDate) => {
        const date = new Date(elementDate);
        return date.getDate();
    };

    const formatMonth = (elementDate) => {
        const date = new Date(elementDate);
        return date.getMonth();
    };

    const handleSubmit = (event) => {
        event.preventDefault();
        const contentNote = event.target.note.value.trim();
        if (!contentNote) return;
        getDataFromForm(month, day, contentNote).then(() => {
            event.target.note.value = "";
        });
    };

    return (
        <motion.div
            className="oneMonth"
            initial={{ scale: 1, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4 }}
        >
            <img onClick={() => window.history.back()} src={Arrow} alt="Back" style={{ width: "18px", marginRight: "1369px", height: "18px", marginTop: "4px", position: "relative",
                top: "23px", marginBottom: "20px" }}/>
            <FormForSearchForm notes={notes} />
            <IconBasket style={{ position: "relative", zIndex: 10, top: 0 }}/>

            <IconPlus indexMonth={parseInt(month) - 1} style={{marginTop: "-19px", position: "relative", left: "38px"}}/>


            <div>
                <div className="wrapper">
                    <div className="head">
                        <h1 className="h1">{day}</h1>
                        <h1 className="h1">{nameMonth[month - 1]}</h1>
                    </div>
                </div>
                <div className="notes-list">
                    {notes
                        .filter((note) => formatDay(note.date) === parseInt(day))
                        .filter((note) => formatMonth(note.date) === parseInt(month) - 1)
                        .filter((note) => !isClickDeleteBut.includes(note.id))
                        .map((note) => (
                            <div key={note.id}>
                                <input
                                    type="checkbox"
                                    checked={doneNotes.includes(note.id)}
                                    onChange={() => handleCheckboxToggle(note.id)}
                                />
                                <label className={doneNotes.includes(note.id) ? "done" : ""}>
                                    {note.notes}
                                </label>
                                {doneNotes.includes(note.id) && (
                                    <button
                                        onClick={() => deleteNote(note.id)}
                                        className="close-button"
                                    >
                                        <img src={CloseButton} alt="close" />
                                    </button>
                                )}
                            </div>
                        ))}
                </div>

                <form id="form" className="form" onSubmit={handleSubmit}>
                    <input
                        placeholder="Add your plane..."
                        type="text"
                        id="note"
                        className="note"
                        autoComplete="off"
                    />
                    <button id="add-note" type="submit">
                        Add
                    </button>
                </form>
            </div>
        </motion.div>
    );
}

export default Notes;
