// backend/controllers/authController.js
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

exports.register = async (req, res, next) => {
  try {
    const { user_name, email, phone_number, password, date_of_birth, pincode, is_admin } = req.body;
    // Check for duplicate email
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) return res.status(400).json({ message: 'Email already registered' });

    const hashedPassword = await bcrypt.hash(password, 10);
    const user = await User.create({
      user_name,
      email,
      phone_number,
      password: hashedPassword,
      date_of_birth,
      pincode,
      is_admin: is_admin || 0
    });
    res.status(201).json({ message: 'User registered', user_id: user.user_id });
  } catch (err) {
    next(err);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ where: { email } });
    if (!user) return res.status(401).json({ message: 'User not found' });

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(401).json({ message: 'Invalid credentials' });

    const token = jwt.sign(
      { userId: user.user_id, isAdmin: user.is_admin },
      process.env.JWT_SECRET || 'your_jwt_secret',
      { expiresIn: '1d' }
    );
    res.json({ message: 'Login successful', token, user });
  } catch (err) {
    next(err);
  }
};
