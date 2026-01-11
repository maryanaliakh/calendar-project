import React from "react";
import { motion } from 'framer-motion';

function AllDaysInYear({ name, indexMonth, days, daysOfWeek, currentDay, currentMonth }) {
    const currentMonthNumber = indexMonth + 1;
    const thisMonthDays = days.filter(day => day.month === currentMonthNumber && day.year === 2025);
    const firstDay = thisMonthDays.find(day => day.day_of_month === 1);
    const emptyCellsCount = firstDay ? Math.max(0, firstDay.number_day_in_week) : 0;
    const emptyCellsBefore = Array(emptyCellsCount).fill(null);

    return (
        <motion.div
            className="oneMonth"
            initial={{ scale: 1, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4 }}
        >
            <div className="month">

                <h3 style={{ color: 'darkred' }}>{name}</h3>

                <div className="days-grid" style={{ display: "grid", gridTemplateColumns: "repeat(7, 40px)", gap: 7 }}>
                    {emptyCellsBefore.map((_, idx) => (
                        <div key={"empty-" + idx} className="day empty"></div>
                    ))}

                    {thisMonthDays.map(day => {
                        const isWeekend = day.number_day_in_week === 5 || day.number_day_in_week === 6;
                        const isToday = day.day_of_month === currentDay && indexMonth === currentMonth;
                        return (
                            <div
                                key={day.full_date}
                                className={`day ${isToday ? 'today' : ''}`}
                                style={{
                                    padding: "8px 0",
                                    textAlign: "center",
                                    backgroundColor: isToday ? "darkred" : "transparent",
                                    color: isToday ? "white" : isWeekend ? "gray" : "black",
                                    borderRadius: "100px",
                                    width: "38px",
                                    userSelect: "none"
                                }}
                            >
                                {day.day_of_month}
                            </div>
                        );
                    })}
                </div>
            </div>
        </motion.div>
    );
}

export default AllDaysInYear;
