// backend/controllers/manufacturersController.js
const Manufacturer = require('../models/Manufacturer');

exports.getManufacturers = async (req, res, next) => {
  try {
    const manufacturers = await Manufacturer.findAll();
    res.json(manufacturers);
  } catch (err) {
    next(err);
  }
};

exports.createManufacturer = async (req, res, next) => {
  try {
    const { manufacturer_name } = req.body;
    const manufacturer = await Manufacturer.create({ manufacturer_name });
    res.status(201).json({ message: 'Manufacturer created', manufacturer_id: manufacturer.manufacturer_id });
  } catch (err) {
    next(err);
  }
};

exports.updateManufacturer = async (req, res, next) => {
  try {
    const { manufacturer_id } = req.params;
    const { manufacturer_name } = req.body;
    await Manufacturer.update({ manufacturer_name }, { where: { manufacturer_id } });
    res.json({ message: 'Manufacturer updated' });
  } catch (err) {
    next(err);
  }
};

exports.deleteManufacturer = async (req, res, next) => {
  try {
    const { manufacturer_id } = req.params;
    await Manufacturer.destroy({ where: { manufacturer_id } });
    res.json({ message: 'Manufacturer deleted' });
  } catch (err) {
    next(err);
  }
};
