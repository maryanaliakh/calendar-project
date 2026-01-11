import React, { useEffect, useState, useContext } from "react";
import { motion } from "framer-motion";
import {useParams} from "react-router-dom";
import { NoteContext } from "../../context/NoteContext.jsx";
import FormForSearchForm from "../../components/FormForSearchNote/FormForSearchNote.jsx";
import IconPlus from "../../components/IconPlus/IconPlus.jsx";
import Arrow from "../../image/button-arrow.png";
import "./ArchiveNotes.css";

function ArchiveNotes() {
    const { month } = useParams();
    const indexMonth = month ? parseInt(month) - 1 : 0;
    const [data, setData] = useState([]);
    const { notes } = useContext(NoteContext);

    useEffect(() => {
        fetch(`${import.meta.env.VITE_API_URL}/deleted`)
            .then(res => res.json())
            .then(data => setData(data))
            .catch(console.error);
    }, []);

    return (
        <motion.div
            className="oneMonth"
            initial={{ scale: 1, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4 }}
        >
            <FormForSearchForm notes={notes} />
            <IconPlus indexMonth={indexMonth} style={{ position: "relative", top:"23px"}} />

            <div className="deleted-fullscreen">
                <div>
                    <img onClick={() => window.history.back()} src={Arrow} alt="Back" style={{ width: "18px", marginRight: "1369px", height: "18px", position: "relative",
                         right: "23px" }}/>

                    <h2 className="deleted-heading">NOTES ARCHIVE</h2>

                    {data.length === 0 ? (
                        <p className="deleted-empty">Archive is empty</p>
                    ) : (
                        <ul className="deleted-list">
                            {data.map(note => {
                                const date = new Date(note.date);
                                const dayStr = String(date.getDate()).padStart(2, "0");
                                const monthStr = String(date.getMonth() + 1).padStart(2, "0");
                                const year = date.getFullYear();

                                return (
                                    <li key={note.id} className="deleted-item">
                                        <span className="deleted-text">{note.notes}</span>
                                        <span className="deleted-date">{dayStr}.{monthStr}.{year}</span>
                                    </li>
                                );
                            })}
                        </ul>
                    )}
                </div>
            </div>
        </motion.div>
    );
}

export default ArchiveNotes;
