// backend/controllers/orderController.js
const Order = require('../models/Order');
const { findNearestPharmacy } = require('../utils/geolocation');

exports.placeOrder = async (req, res, next) => {
  try {
    const { user_id, cart_id, unique_id, total, user_pincode } = req.body;
    // Find the nearest pharmacy using the user's pincode
    const pharmacy = await findNearestPharmacy(user_pincode);
    if (!pharmacy) return res.status(404).json({ message: 'No pharmacy available in your area' });

    const order = await Order.create({ cart_id, user_id, unique_id, total, status: 'Placed' });
    res.status(201).json({ message: 'Order placed', order_id: order.order_id, pharmacy });
  } catch (err) {
    next(err);
  }
};

exports.cancelOrder = async (req, res, next) => {
  try {
    const { order_id } = req.params;
    await Order.update({ status: 'Cancelled' }, { where: { order_id } });
    res.json({ message: 'Order cancelled' });
  } catch (err) {
    next(err);
  }
};

exports.getOrder = async (req, res, next) => {
  try {
    const { order_id } = req.params;
    const order = await Order.findOne({ where: { order_id } });
    res.json(order);
  } catch (err) {
    next(err);
  }
};
