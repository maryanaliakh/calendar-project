# 🗓 Notes Calendar App

A web application for creating and managing notes tied to calendar days. You can add, view, complete, and delete notes — all in an intuitive monthly view.

## 🚀 Features

- 📅 View calendar by months
- ➕ Add notes for specific days
- ✅ Mark notes as completed
- 🗑 View and manage deleted notes
- 🔍 Search notes by keywords

## 🛠 Technologies

### Frontend:
- React + Vite
- React Router DOM
- Framer Motion (for animations)
- Context API (state management)
- CSS

### Backend:
- Express.js (Node.js)
- JSON-based storage or simple file-based DB

### 📦 Database

This project includes a ready-to-use PostgreSQL database script.


## ▶️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/maryanaliakh/calendar-project.git
cd calendar-project
```

### 2. Install dependencies
#### Client:
```bash
cd project
npm install
```

#### Server:
```bash
cd ../server
npm install
```

### 3. Run the app
- Open two terminals:
#### Frontend (Vite):
```bash
cd project
npm run dev
```

#### Backend (Express):
```bash
cd server
node server.js
```
Make sure the backend is running on a port that the frontend can proxy to (e.g. http://localhost:1234/year).

#### MIT License © Maryana Liakh