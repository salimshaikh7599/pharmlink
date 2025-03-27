// backend/routes/cartRoutes.js
const express = require('express');
const { addToCart, getCart, updateCartItem, removeCartItem } = require('../controllers/cartController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.post('/', protect, addToCart);
router.get('/:user_id', protect, getCart);
router.put('/:cart_id', protect, updateCartItem);
router.delete('/:cart_id', protect, removeCartItem);

module.exports = router;
