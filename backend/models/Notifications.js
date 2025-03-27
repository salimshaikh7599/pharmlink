// backend/models/Notifications.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Notifications = sequelize.define('Notifications', {
  notification_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  description: { type: DataTypes.TEXT, allowNull: true },
  user_id: { type: DataTypes.INTEGER, allowNull: true },
}, {
  tableName: 'notifications',
  timestamps: false,
});

module.exports = Notifications;
