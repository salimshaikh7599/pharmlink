// backend/routes/uploadCsvRoutes.js
const express = require('express');
const multer = require('multer');
const path = require('path');
const { uploadCsv } = require('../controllers/uploadCsvController');
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

router.post('/', protect, upload.single('csv'), uploadCsv);

module.exports = router;
