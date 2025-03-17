// backend/controllers/productController.js
const Product = require('../models/Product');

exports.getProducts = async (req, res, next) => {
  try {
    const products = await Product.findAll();
    res.json(products);
  } catch (err) {
    next(err);
  }
};

exports.addProduct = async (req, res, next) => {
  try {
    const productData = {
      ...req.body,
      image_url: req.file ? `/uploads/${req.file.filename}` : null,
    };
    const product = await Product.create(productData);
    res.status(201).json({ message: 'Product added', product_id: product.product_id });
  } catch (err) {
    next(err);
  }
};
