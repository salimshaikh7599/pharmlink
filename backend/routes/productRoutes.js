// backend/routes/productRoutes.js
const express = require('express');
const multer = require('multer');
const path = require('path');
const { getProducts, addProduct } = require('../controllers/productController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  }
});
const upload = multer({ storage });

router.get('/', getProducts);
router.post('/', protect, upload.single('image'), addProduct);

module.exports = router;
