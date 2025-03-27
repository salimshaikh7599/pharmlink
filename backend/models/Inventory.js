// backend/models/Inventory.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Inventory = sequelize.define('Inventory', {
  inventory_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  product_id: { type: DataTypes.INTEGER, allowNull: true },
  pharmacy_id: { type: DataTypes.INTEGER, allowNull: true },
  quantity: { type: DataTypes.INTEGER, allowNull: true },
}, {
  tableName: 'inventory',
  timestamps: false,
});

module.exports = Inventory;
