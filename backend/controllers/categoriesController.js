// backend/controllers/categoriesController.js
const Category = require('../models/Category');

exports.getCategories = async (req, res, next) => {
  try {
    const categories = await Category.findAll();
    res.json(categories);
  } catch (err) {
    next(err);
  }
};

exports.createCategory = async (req, res, next) => {
  try {
    const { category_name } = req.body;
    const category = await Category.create({ category_name });
    res.status(201).json({ message: 'Category created', category_id: category.category_id });
  } catch (err) {
    next(err);
  }
};

exports.updateCategory = async (req, res, next) => {
  try {
    const { category_id } = req.params;
    const { category_name } = req.body;
    await Category.update({ category_name }, { where: { category_id } });
    res.json({ message: 'Category updated' });
  } catch (err) {
    next(err);
  }
};

exports.deleteCategory = async (req, res, next) => {
  try {
    const { category_id } = req.params;
    await Category.destroy({ where: { category_id } });
    res.json({ message: 'Category deleted' });
  } catch (err) {
    next(err);
  }
};
