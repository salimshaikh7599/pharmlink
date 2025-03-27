// backend/routes/pharmacyRoutes.js
const express = require('express');
const { getPharmacyOrders, updateOrderStatus } = require('../controllers/pharmacyController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/:pharmacy_id/orders', protect, getPharmacyOrders);
router.put('/orders/:order_id', protect, updateOrderStatus);

module.exports = router;
