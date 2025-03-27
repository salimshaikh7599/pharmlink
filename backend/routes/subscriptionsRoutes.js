// backend/routes/subscriptionsRoutes.js
const express = require('express');
const { getSubscriptions, createSubscriptionPlan, updateSubscriptionPlan, deleteSubscriptionPlan } = require('../controllers/subscriptionsController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/', protect, getSubscriptions);
router.post('/', protect, createSubscriptionPlan);
router.put('/:subscription_id', protect, updateSubscriptionPlan);
router.delete('/:subscription_id', protect, deleteSubscriptionPlan);

module.exports = router;
