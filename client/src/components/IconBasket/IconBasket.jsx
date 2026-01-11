import React from "react";
import {useNavigate} from "react-router-dom"
import trash from "../../image/button-delete.png";
import "../../pages/PageArchiveNotes/ArchiveNotes.css"

function IconBasket () {
    const navigate = useNavigate();
    const handleBasketClick = () => {
        navigate("/notes/deleted")
    }

    return(
        <>
            <img
                src={trash}
                alt="Deleted Notes"
                className="basket-icon"
                onClick={handleBasketClick}
            />
        </>
    )
}

export default IconBasket;