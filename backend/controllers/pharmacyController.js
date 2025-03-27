// backend/controllers/pharmacyController.js
const Order = require('../models/Order');

exports.getPharmacyOrders = async (req, res, next) => {
  try {
    const { pharmacy_id } = req.params;
    // Adjust this logic if pharmacy_id is stored differently (e.g., via association)
    const orders = await Order.findAll({ where: { pharmacy_id } });
    res.json(orders);
  } catch (err) {
    next(err);
  }
};

exports.updateOrderStatus = async (req, res, next) => {
  try {
    const { order_id } = req.params;
    const { status } = req.body;
    await Order.update({ status }, { where: { order_id } });
    res.json({ message: 'Order status updated' });
  } catch (err) {
    next(err);
  }
};
