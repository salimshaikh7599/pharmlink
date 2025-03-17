// backend/models/Manufacturer.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Manufacturer = sequelize.define('Manufacturer', {
  manufacturer_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  manufacturer_name: { type: DataTypes.STRING(100), allowNull: true },
}, {
  tableName: 'manufacturers',
  timestamps: false,
});

module.exports = Manufacturer;
