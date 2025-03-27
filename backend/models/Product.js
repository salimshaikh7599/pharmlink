// backend/models/Product.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Product = sequelize.define('Product', {
  product_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  product_name: { type: DataTypes.STRING(100), allowNull: true },
  category_id: { type: DataTypes.INTEGER, allowNull: true },
  manufacturer_id: { type: DataTypes.INTEGER, allowNull: true },
  type: { type: DataTypes.STRING(50), allowNull: true },
  mrp: { type: DataTypes.DECIMAL(10,2), allowNull: true },
  generic: { type: DataTypes.STRING(100), allowNull: true },
  side_effects: { type: DataTypes.TEXT, allowNull: true },
  uses: { type: DataTypes.TEXT, allowNull: true },
  interactions: { type: DataTypes.TEXT, allowNull: true },
  prescription_required: { type: DataTypes.TINYINT, allowNull: true },
  image_url: { type: DataTypes.STRING(255), allowNull: true },
}, {
  tableName: 'products',
  timestamps: false,
});

module.exports = Product;
