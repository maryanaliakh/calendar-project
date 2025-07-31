import React, { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import FormForAddNote from "../FormForAddNote/FormForAddNote.jsx";
import Plus from "../../image/button-plus.png"
import "./IconPlus.css"

const IconPlus = ({style, indexMonth = null, setIsNotes}) => {
    const [showForm, setShowForm] = useState(false);

    return (
        <>
                <img
                    src={Plus}
                    alt="Add"
                    onClick={() => setShowForm(true)}
                    className="plus-icon"
                    style={style}
                />

            <AnimatePresence>
                {showForm && (
                    <motion.div
                        className="form-overlay"
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        exit={{ opacity: 0 }}
                        style={{
                            position: "fixed",
                            top: 0,
                            left: 0,
                            width: "100vw",
                            height: "100vh",
                            backgroundColor: "rgba(0, 0, 0, 0.3)",
                            display: "flex",
                            justifyContent: "center",
                            alignItems: "center",
                            zIndex: 1000
                        }}
                        onClick={() => setShowForm(false)}
                    >
                        <motion.div
                            initial={{ scale: 0.8, opacity: 0 }}
                            animate={{ scale: 1, opacity: 1 }}
                            exit={{ scale: 0.8, opacity: 0 }}
                            transition={{ duration: 0.4 }}
                            onClick={(e) => e.stopPropagation()}
                        >
                            <FormForAddNote indexMonth={indexMonth} setIsNotes={setIsNotes} onClose={() => setShowForm(false)} />
                        </motion.div>
                    </motion.div>
                )}
            </AnimatePresence>
        </>
    );
};

export default IconPlus;
