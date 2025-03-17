// backend/routes/categoriesRoutes.js
const express = require('express');
const { getCategories, createCategory, updateCategory, deleteCategory } = require('../controllers/categoriesController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/', protect, getCategories);
router.post('/', protect, createCategory);
router.put('/:category_id', protect, updateCategory);
router.delete('/:category_id', protect, deleteCategory);

module.exports = router;
