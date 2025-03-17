// backend/models/User.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const User = sequelize.define('User', {
  user_id: {
    type: DataTypes.BIGINT.UNSIGNED,
    autoIncrement: true,
    primaryKey: true,
  },
  user_name: { type: DataTypes.STRING(100), allowNull: true },
  email: { type: DataTypes.STRING(100), allowNull: false, unique: true },
  phone_number: { type: DataTypes.STRING(15), allowNull: true },
  password: { type: DataTypes.STRING(255), allowNull: true },
  date_of_birth: { type: DataTypes.DATEONLY, allowNull: true },
  pincode: { type: DataTypes.STRING(6), allowNull: true },
  is_admin: { type: DataTypes.TINYINT, defaultValue: 0 },
  is_pharmacy: { type: DataTypes.TINYINT, defaultValue: 0 } // 0 = normal user, 1 = pharmacy
}, {
  tableName: 'users',
  timestamps: false,
});

module.exports = User;
