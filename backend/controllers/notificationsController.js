// backend/controllers/notificationsController.js
const Notifications = require('../models/Notifications');

exports.createNotification = async (req, res, next) => {
  try {
    const { description, user_id } = req.body;
    const notification = await Notifications.create({ description, user_id });
    res.status(201).json({ message: 'Notification created', notification_id: notification.notification_id });
  } catch (err) {
    next(err);
  }
};

exports.getNotificationsForUser = async (req, res, next) => {
  try {
    const { user_id } = req.params;
    const notifications = await Notifications.findAll({ where: { user_id } });
    res.json(notifications);
  } catch (err) {
    next(err);
  }
};
