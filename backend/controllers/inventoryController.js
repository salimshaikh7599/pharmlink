// backend/controllers/inventoryController.js
const Inventory = require('../models/Inventory');

exports.getInventory = async (req, res, next) => {
  try {
    const inventory = await Inventory.findAll();
    res.json(inventory);
  } catch (err) {
    next(err);
  }
};

exports.createInventoryRecord = async (req, res, next) => {
  try {
    const { product_id, pharmacy_id, quantity } = req.body;
    const record = await Inventory.create({ product_id, pharmacy_id, quantity });
    res.status(201).json({ message: 'Inventory record created', inventory_id: record.inventory_id });
  } catch (err) {
    next(err);
  }
};

exports.updateInventory = async (req, res, next) => {
  try {
    const { inventory_id } = req.params;
    const { quantity } = req.body;
    await Inventory.update({ quantity }, { where: { inventory_id } });
    res.json({ message: 'Inventory updated' });
  } catch (err) {
    next(err);
  }
};

exports.deleteInventoryRecord = async (req, res, next) => {
  try {
    const { inventory_id } = req.params;
    await Inventory.destroy({ where: { inventory_id } });
    res.json({ message: 'Inventory record deleted' });
  } catch (err) {
    next(err);
  }
};
