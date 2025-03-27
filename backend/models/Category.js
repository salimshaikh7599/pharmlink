// backend/models/Category.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Category = sequelize.define('Category', {
  category_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  category_name: { type: DataTypes.STRING(50), allowNull: true },
}, {
  tableName: 'categories',
  timestamps: false,
});

module.exports = Category;
