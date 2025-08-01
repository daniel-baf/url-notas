const { fetchUsers, saveUser } = require("../models/userModel");

// Obtener usuarios
const getUsers = async (req, res) => {
  try {
    const users = await fetchUsers();
    res.status(200).json(users);
  } catch (error) {
    res.status(500).json({ error: "Error al obtener los usuarios" });
  }
};

// Crear usuario
const createUser = async (req, res) => {
  const { name, email } = req.body;

  if (!name || !email) {
    return res
      .status(400)
      .json({ error: "Faltan datos requeridos (name, email)" });
  }

  try {
    const newUser = await saveUser({ name, email });
    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({ error: "Error al crear el usuario" });
  }
};

module.exports = { getUsers, createUser };
