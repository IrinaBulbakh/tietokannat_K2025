import express from "express";
import pool from "./db/database.js";

const app = express();
app.use(express.json());

app.get("/db-test", async (req, res) => {
  // Tietokantayhteyden testaus
  try {
    const [rows] = await pool.query("SELECT 1");
    res.json({ db: "connected" });
  } catch (error) {
    res.status(500).json({ error: "db error" });
  }
});

app.get("/health", (req, res) => {
  // Palvelimen tarkistus
  res.json({ status: "ok" });
});
app.get("/books", async (req, res) => {
  // Hae kaikki kirjat
  try {
    const [rows] = await pool.query("SELECT * FROM book");
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.post("/books", async (req, res) => {
  // Lisaa uusi kirja
  const { name, author, isbn } = req.body;

  try {
    const [result] = await pool.query(
      "INSERT INTO book (name, author, isbn) VALUES (?, ?, ?)",
      [name, author, isbn]
    );
    res.status(201).json({ id_book: result.insertId });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.get("/books/:id", async (req, res) => {
  // Hae kirja id:n perusteella
  const id = req.params.id;

  try {
    const [rows] = await pool.query(
      "SELECT * FROM book WHERE id_book = ?",
      [id]
    );

    if (rows.length === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.put("/books/:id", async (req, res) => {
  // Paivita kirja
  const id = req.params.id;
  const { name, author, isbn } = req.body;

  try {
    const [result] = await pool.query(
      "UPDATE book SET name = ?, author = ?, isbn = ? WHERE id_book = ?",
      [name, author, isbn, id]
    );

    if (result.affectedRows === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json({ updated: true });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.delete("/books/:id", async (req, res) => {
  // Poista kirja
  const id = req.params.id;

  try {
    const [result] = await pool.query(
      "DELETE FROM book WHERE id_book = ?",
      [id]
    );

    if (result.affectedRows === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json({ deleted: true });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.get("/borrowers", async (req, res) => {
  // Hae kaikki lainaajat
  try {
    const [rows] = await pool.query("SELECT * FROM borrower");
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.post("/borrowers", async (req, res) => {
  // Lisaa uusi lainaaja
  const { fname, lname, streetaddress } = req.body;

  try {
    const [result] = await pool.query(
      "INSERT INTO borrower (fname, lname, streetaddress) VALUES (?, ?, ?)",
      [fname, lname, streetaddress]
    );
    res.status(201).json({ id_borrower: result.insertId });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.get("/borrowers/:id", async (req, res) => {
  // Hae lainaaja id:n perusteella
  const id = req.params.id;

  try {
    const [rows] = await pool.query(
      "SELECT * FROM borrower WHERE id_borrower = ?",
      [id]
    );

    if (rows.length === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.put("/borrowers/:id", async (req, res) => {
  // Paivita lainaaja
  const id = req.params.id;
  const { fname, lname, streetaddress } = req.body;

  try {
    const [result] = await pool.query(
      "UPDATE borrower SET fname = ?, lname = ?, streetaddress = ? WHERE id_borrower = ?",
      [fname, lname, streetaddress, id]
    );

    if (result.affectedRows === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json({ updated: true });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});
app.delete("/borrowers/:id", async (req, res) => {
  // Poista lainaaja
  const id = req.params.id;

  try {
    const [result] = await pool.query(
      "DELETE FROM borrower WHERE id_borrower = ?",
      [id]
    );

    if (result.affectedRows === 0) {
      res.status(404).json({ error: "not found" });
      return;
    }

    res.json({ deleted: true });
  } catch (error) {
    res.status(500).json({ error: "database error" });
  }
});

const PORT = 3000;

app.listen(PORT, () => {
  // Palvelin kaynnissa
  console.log(`Server running on port ${PORT}`);
});
