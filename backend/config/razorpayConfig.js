// backend/config/razorpayConfig.js
const Razorpay = require('razorpay');
require('dotenv').config();

const instance = new Razorpay({
  key_id: process.env.RAZORPAY_KEY_ID || 'your_test_mode_key_id',
  key_secret: process.env.RAZORPAY_KEY_SECRET || 'your_test_mode_key_secret'
});

module.exports = instance;
