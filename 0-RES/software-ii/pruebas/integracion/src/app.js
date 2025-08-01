const express = require('express');
const userRoutes = require('./routes/userRoutes');

const app = express();
app.use(express.json());

// Rutas
app.use('/api/users', userRoutes);

module.exports = app;
