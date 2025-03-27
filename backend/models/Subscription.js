// backend/models/Subscription.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

const Subscription = sequelize.define('Subscription', {
  subscription_id: { type: DataTypes.BIGINT.UNSIGNED, autoIncrement: true, primaryKey: true },
  plan_name: { type: DataTypes.STRING(50), allowNull: true },
  plan_price: { type: DataTypes.DECIMAL(10,2), allowNull: true },
}, {
  tableName: 'subscriptions',
  timestamps: false,
});

module.exports = Subscription;
