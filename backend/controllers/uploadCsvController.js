// backend/controllers/uploadCsvController.js
const fs = require('fs');
const csv = require('csv-parser');
const Product = require('../models/Product');

exports.uploadCsv = async (req, res, next) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: 'No CSV file uploaded' });
    }
    const results = [];
    fs.createReadStream(req.file.path)
      .pipe(csv())
      .on('data', (data) => results.push(data))
      .on('end', async () => {
        try {
          // Assume CSV columns: product_name, category_id, manufacturer_id, type, mrp, generic, side_effects, uses, interactions, prescription_required
          for (let row of results) {
            await Product.create({
              product_name: row.product_name,
              category_id: row.category_id,
              manufacturer_id: row.manufacturer_id,
              type: row.type,
              mrp: parseFloat(row.mrp),
              generic: row.generic,
              side_effects: row.side_effects,
              uses: row.uses,
              interactions: row.interactions,
              prescription_required: row.prescription_required.toLowerCase() === 'true' ? 1 : 0,
              image_url: null, // CSV does not include an image URL
            });
          }
          return res.json({ message: 'CSV products uploaded successfully', count: results.length });
        } catch (err) {
          next(err);
        }
      });
  } catch (err) {
    next(err);
  }
};
