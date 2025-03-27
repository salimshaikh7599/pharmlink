// backend/routes/notificationsRoutes.js
const express = require('express');
const { createNotification, getNotificationsForUser } = require('../controllers/notificationsController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/', protect, createNotification);
router.get('/:user_id', protect, getNotificationsForUser);

module.exports = router;
