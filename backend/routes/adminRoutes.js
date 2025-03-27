// backend/routes/adminRoutes.js
const express = require('express');
const { getAllUsers, getAllOrders } = require('../controllers/adminController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/users', protect, getAllUsers);
router.get('/orders', protect, getAllOrders);

module.exports = router;
