// backend/models/Order.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Order = sequelize.define('Order', {
  order_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  cart_id: { type: DataTypes.INTEGER, allowNull: true },
  user_id: { type: DataTypes.INTEGER, allowNull: true },
  unique_id: { type: DataTypes.INTEGER, allowNull: true },
  total: { type: DataTypes.DECIMAL(10,2), allowNull: true },
  status: { type: DataTypes.STRING(20), allowNull: true },
  timestamp: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
}, {
  tableName: 'orders',
  timestamps: false,
});

module.exports = Order;
