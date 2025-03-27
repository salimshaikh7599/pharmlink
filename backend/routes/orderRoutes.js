// backend/routes/orderRoutes.js
const express = require('express');
const { placeOrder, cancelOrder, getOrder } = require('../controllers/orderController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/', protect, placeOrder);
router.put('/:order_id/cancel', protect, cancelOrder);
router.get('/:order_id', protect, getOrder);

module.exports = router;
