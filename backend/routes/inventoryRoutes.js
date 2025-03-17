// backend/routes/inventoryRoutes.js
const express = require('express');
const { getInventory, createInventoryRecord, updateInventory, deleteInventoryRecord } = require('../controllers/inventoryController');
const { protect } = require('../middleware/authMiddleware');
const router = express.Router();

router.get('/', protect, getInventory);
router.post('/', protect, createInventoryRecord);
router.put('/:inventory_id', protect, updateInventory);
router.delete('/:inventory_id', protect, deleteInventoryRecord);

module.exports = router;
