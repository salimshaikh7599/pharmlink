// backend/config/sequelize.js
const { Sequelize } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(
  process.env.DB_NAME || 'pharmlink',
  process.env.DB_USER || 'root',
  process.env.DB_PASSWORD || 'yourpassword',
  {
    host: process.env.DB_HOST || 'localhost',
    dialect: 'mysql',
    logging: false, // Set to console.log for debugging
  }
);

module.exports = sequelize;
