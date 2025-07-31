import React, {useState, useEffect, useContext} from "react";
import { useNavigate, useParams } from 'react-router-dom';
import {motion} from 'framer-motion';
import {NoteContext} from "../../context/NoteContext.jsx";
import Arrow from "../../image/button-arrow.png";
import FormForSearchForm from "../../components/FormForSearchNote/FormForSearchNote.jsx";
import IconBasket from "../../components/IconBasket/IconBasket.jsx";
import IconPlus from "../../components/IconPlus/IconPlus.jsx";
import "./OneMonth.css";

function OneMonth() {
    const { notes } = useContext(NoteContext);
    const { month } = useParams();
    const indexMonth = parseInt(month) - 1;
    const currentDay = new Date().getDate();
    const currentMonth = new Date().getMonth();
    const navigate = useNavigate();

    const [daysOfWeek, setDaysOfWeek] = useState([]);
    const [days, setDays] = useState([]);
    const [IsNotes, setIsNotes] = useState([]);

    useEffect(() => {
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
    }, [indexMonth]);

    const hasNote = (day) => {
        return IsNotes.some(note => {
            const noteDate = new Date(note.date);
            return (
                noteDate.getDate() === day.day_of_month &&
                noteDate.getMonth() === indexMonth
            );
        });
    };

    const handleDayClick = (day) => {
        navigate(`/notes/${indexMonth + 1}/${day}`);
    };

    useEffect(() => {
        fetch('http://localhost:1234/days_of_week_name')
            .then(res => res.json())
            .then(setDaysOfWeek)
            .catch(console.error);
    }, []);

    useEffect(() => {
        fetch('http://localhost:1234/days')
            .then(res => res.json())
            .then(setDays)
            .catch(console.error);
    }, []);

    const currentMonthDays = days.filter(d => d.month === indexMonth + 1 && d.year === 2025);
    const firstDay = currentMonthDays.find(d => d.day_of_month === 1);
    const offset = firstDay ? (firstDay.number_day_in_week % 7) : 0;
    const empty = Array(offset).fill(null);

    const sortedWeek = [...daysOfWeek].sort((a, b) => a.number_day_in_week - b.number_day_in_week);

    return (
        <motion.div
            className="oneMonth"
            initial={{ scale: 1, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4 }}
        >
            <FormForSearchForm notes={notes}/>
            <IconBasket/>
            <div className="oneMonth-header">
                <div className="oneMonth-header-content">
                        <div className="oneMonth-header-top">
                            <a href="/year" className="back-arrow" style={{ display: "flex", alignItems: "center", color: "darkred", fontWeight: "700", fontSize: "18px", textDecoration: "none" }} >
                                <img
                                    src={Arrow}
                                    alt="Back"
                                    style={{ width: "18px", marginRight: "7px", height: "18px" }}
                                />
                                2025
                            </a>
                            <IconPlus indexMonth={indexMonth} setIsNotes={setIsNotes}/>
                        </div>

                    <h3>
                        {new Date(2025, indexMonth).toLocaleString('en-US', { month: 'long' }).toUpperCase()}
                    </h3>

                    <div className="oneMonthWeekdays">
                        {sortedWeek.map(day => (
                            <div key={day.id}>{day.name_day}</div>
                        ))}
                    </div>
                </div>
            </div>

            <div className="oneMonthDays-grid">
                {empty.map((_, i) => (
                    <div key={"empty-" + i} className="day empty"></div>
                ))}

                {currentMonthDays.map(day => {
                    const isWeekday = day.day_of_month === currentDay && indexMonth === currentMonth;
                    const isWeekend = day.number_day_in_week === 5 || day.number_day_in_week === 6;

                    return (
                        <div
                            key={day.full_date}
                            onClick={() => handleDayClick(day.day_of_month)}
                            className={`day ${isWeekday ? "today" : ""}`}
                            style={{
                                backgroundColor: isWeekday ? "darkred" : "transparent",
                                color: isWeekday ? "white" : isWeekend ? "gray" : "black",
                                width: isWeekday ? "60px" : "auto",
                                height: isWeekday ? "1px" : "auto",
                                borderRadius: isWeekday ? "50%" : "0",
                                display: isWeekday ? "flex" : "block",
                                alignItems: "center",
                                justifyContent: "center",
                                margin: "0 auto",
                                fontSize: "16px",
                                marginTop: isWeekday ? "14px" : "",
                            }}
                        >
                            {day.day_of_month}

                            <div style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
                                {hasNote(day) && (
                                    <span
                                        style={{
                                            width: "8px",
                                            height: "8px",
                                            backgroundColor: "red",
                                            borderRadius: "50%"
                                        }}
                                    />
                                )}
                            </div>
                        </div>
                    );
                })}
            </div>
        </motion.div>
    );
}

export default OneMonth;
