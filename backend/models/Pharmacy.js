// backend/models/Pharmacy.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Pharmacy = sequelize.define('Pharmacy', {
  pharmacy_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  pharmacy_name: { type: DataTypes.STRING(100), allowNull: true },
  location: { type: DataTypes.TEXT, allowNull: true },
  drug_license: { type: DataTypes.STRING(100), allowNull: true },
  subscription_id: { type: DataTypes.INTEGER, allowNull: true },
  expiry_date: { type: DataTypes.DATEONLY, allowNull: true },
  creation_date: { type: DataTypes.DATEONLY, allowNull: true },
  status: { type: DataTypes.TINYINT, defaultValue: 1 },
  timings: { type: DataTypes.STRING(50), allowNull: true },
  is_verified: { type: DataTypes.TINYINT, defaultValue: 0 },
}, {
  tableName: 'pharmacies',
  timestamps: false,
});

module.exports = Pharmacy;
