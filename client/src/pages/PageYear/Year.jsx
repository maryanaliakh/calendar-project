import React, {useState, useEffect} from "react";
import { useNavigate } from 'react-router-dom';
import { motion } from 'framer-motion';
import AllDaysInYear from "../../components/AllDayInYear/AllDaysInYear.jsx";

export const nameMonth = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
    "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];

function Year() {
    const navigate = useNavigate();
    const currentDay = new Date().getDate();
    const currentMonth = new Date().getMonth();
    const[daysOfWeek, setDaysOfWeek] = useState([]);
    const[days, setDays] = useState([]);

    useEffect(() => {
        fetch(`${import.meta.env.VITE_API_URL}/days_of_week_name`)
            .then((response) => response.json())
            .then((data) => setDaysOfWeek(data))
            .catch(error => console.error('Error fetching day of the week: ' + error))
    }, [])

    useEffect(() => {
        fetch(`${import.meta.env.VITE_API_URL}/days`)
            .then((response) => response.json())
            .then((data) => setDays(data))
            .catch(error => console.error('Error fetching days: ' + error))
    }, [])

    return(
        <motion.div
            className="oneMonth"
            initial={{ scale: 1, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4 }}
        >
            <h1 style={{color: "darkred"}}>2025</h1>
            {[0,1,2,3].map(row=> (
                <div className="month-row" key={`${row}`}>
            {[0,1,2].map(col => {
                const indexMonth = row * 3 + col;
                const name = nameMonth[indexMonth]
                return(
                    <>
                    <div
                        key={indexMonth}
                        onClick={() => navigate(`/year/${indexMonth + 1}`)}
                        style={{
                            cursor: "pointer",
                            transition: "transform 0.2s ease"
                        }}
                        onMouseEnter={e => e.currentTarget.style.transform = "scale(1.02)"}
                        onMouseLeave={e => e.currentTarget.style.transform = "scale(1)"}
                    >
                        <AllDaysInYear
                            name={name}
                            indexMonth={indexMonth}
                            days={days}
                            daysOfWeek={daysOfWeek}
                            currentDay={currentDay}
                            currentMonth={currentMonth}
                        />
                    </div>
                    </>
                )
            })}
                </div>
            ))}
        </motion.div>
    )
}

export default Year;