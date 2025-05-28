const db = require("../utils/database");

const fetchUsers = async () => {
  // Simulación de una consulta a la base de datos
  return db.query("SELECT id, name, email FROM users");
};

const saveUser = async (user) => {
  // Simulación de inserción en la base de datos
  const result = await db.query(
    "INSERT INTO users (name, email) VALUES (?, ?)",
    [user.name, user.email]
  );
  return { id: result.insertId, ...user };
};

module.exports = { fetchUsers, saveUser };
