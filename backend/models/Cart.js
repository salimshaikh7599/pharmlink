// backend/models/Cart.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Cart = sequelize.define('Cart', {
  cart_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  user_id: { type: DataTypes.INTEGER, allowNull: true },
  pharmacy_id: { type: DataTypes.INTEGER, allowNull: true },
  product_id: { type: DataTypes.INTEGER, allowNull: true },
  unique_id: { type: DataTypes.INTEGER, allowNull: true },
  quantity: { type: DataTypes.INTEGER, allowNull: true },
}, {
  tableName: 'cart',
  timestamps: false,
});

module.exports = Cart;
