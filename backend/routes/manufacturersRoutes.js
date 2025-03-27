// backend/routes/manufacturersRoutes.js
const express = require('express');
const { getManufacturers, createManufacturer, updateManufacturer, deleteManufacturer } = require('../controllers/manufacturersController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/', protect, getManufacturers);
router.post('/', protect, createManufacturer);
router.put('/:manufacturer_id', protect, updateManufacturer);
router.delete('/:manufacturer_id', protect, deleteManufacturer);

module.exports = router;
