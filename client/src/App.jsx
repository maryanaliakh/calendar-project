import './App.css';
import Notes from './pages/PageNotes/Notes.jsx';
import Year from './pages/PageYear/Year.jsx';
import OneMonth from "./pages/PageOneMonth/OneMonth.jsx";
import ArchiveNotes from "./pages/PageArchiveNotes/ArchiveNotes.jsx";
import {BrowserRouter, Routes, Route} from "react-router-dom";
import { NoteProvider } from "./context/NoteContext.jsx";

function App() {
  return (
    <>
        <NoteProvider>
            <BrowserRouter>
                <Routes>
                    <Route path={'/notes/:month/:day'} element={<Notes/>}/>
                    <Route path={'/year'} element={<Year/>}/>
                    <Route path={"/year/:month"} element={<OneMonth/>} />
                    <Route path={"/notes/deleted"} element={<ArchiveNotes/>} />
                </Routes>
            </BrowserRouter>
        </NoteProvider>
            </>
  )
}

export default App
