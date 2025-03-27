// backend/controllers/paymentController.js
const Razorpay = require('../config/razorpayConfig');

exports.createSubscriptionOrder = async (req, res, next) => {
  try {
    const { plan_id, amount } = req.body;
    const options = {
      amount: amount * 100, // amount in paise
      currency: "INR",
      receipt: `receipt_order_${Date.now()}`
    };
    const order = await Razorpay.orders.create(options);
    res.json({ order });
  } catch (err) {
    next(err);
  }
};
