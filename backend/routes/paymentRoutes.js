// backend/routes/paymentRoutes.js
const express = require('express');
const { createSubscriptionOrder } = require('../controllers/paymentController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/subscription', protect, createSubscriptionOrder);

module.exports = router;
