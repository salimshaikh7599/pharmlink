// backend/controllers/cartController.js
const Cart = require('../models/Cart');

exports.addToCart = async (req, res, next) => {
  try {
    const { user_id, pharmacy_id, product_id, unique_id, quantity } = req.body;
    const cartItem = await Cart.create({ user_id, pharmacy_id, product_id, unique_id, quantity });
    res.status(201).json({ message: 'Item added to cart', cart_id: cartItem.cart_id });
  } catch (err) {
    next(err);
  }
};

exports.getCart = async (req, res, next) => {
  try {
    const { user_id } = req.params;
    const cartItems = await Cart.findAll({ where: { user_id } });
    res.json(cartItems);
  } catch (err) {
    next(err);
  }
};

exports.updateCartItem = async (req, res, next) => {
  try {
    const { cart_id } = req.params;
    const { quantity } = req.body;
    await Cart.update({ quantity }, { where: { cart_id } });
    res.json({ message: 'Cart updated' });
  } catch (err) {
    next(err);
  }
};

exports.removeCartItem = async (req, res, next) => {
  try {
    const { cart_id } = req.params;
    await Cart.destroy({ where: { cart_id } });
    res.json({ message: 'Item removed from cart' });
  } catch (err) {
    next(err);
  }
};
