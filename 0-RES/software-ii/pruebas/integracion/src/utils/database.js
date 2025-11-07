const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database(":memory:");

// Configuración de una base de datos en memoria
db.serialize(() => {
  db.run(`
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE
    )
  `);
  db.run(
    "INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com')"
  );
});

module.exports = {
  query: (sql, params = []) => {
    return new Promise((resolve, reject) => {
      db.all(sql, params, (err, rows) => {
        if (err) return reject(err);
        resolve(rows);
      });
    });
  },
};
