// backend/controllers/subscriptionsController.js
const Subscription = require('../models/Subscription');

exports.getSubscriptions = async (req, res, next) => {
  try {
    const subscriptions = await Subscription.findAll();
    res.json(subscriptions);
  } catch (err) {
    next(err);
  }
};

exports.createSubscriptionPlan = async (req, res, next) => {
  try {
    const { plan_name, plan_price } = req.body;
    const subscription = await Subscription.create({ plan_name, plan_price });
    res.status(201).json({ message: 'Subscription plan created', subscription_id: subscription.subscription_id });
  } catch (err) {
    next(err);
  }
};

exports.updateSubscriptionPlan = async (req, res, next) => {
  try {
    const { subscription_id } = req.params;
    const { plan_name, plan_price } = req.body;
    await Subscription.update({ plan_name, plan_price }, { where: { subscription_id } });
    res.json({ message: 'Subscription plan updated' });
  } catch (err) {
    next(err);
  }
};

exports.deleteSubscriptionPlan = async (req, res, next) => {
  try {
    const { subscription_id } = req.params;
    await Subscription.destroy({ where: { subscription_id } });
    res.json({ message: 'Subscription plan deleted' });
  } catch (err) {
    next(err);
  }
};
