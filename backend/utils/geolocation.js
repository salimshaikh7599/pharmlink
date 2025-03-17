// backend/utils/geolocation.js
const Pharmacy = require('../models/Pharmacy');

exports.findNearestPharmacy = async (userPincode) => {
  // Simple implementation: find one pharmacy matching the pincode with active status.
  const pharmacy = await Pharmacy.findOne({ where: { pincode: userPincode, status: 1 } });
  return pharmacy;
};
