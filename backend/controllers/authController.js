// backend/controllers/authController.js
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
require("dotenv").config();

exports.register = async (req, res, next) => {
  try {
    const { first_name, last_name, email, phone, password, role } = req.body;

    // Check for duplicate email
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ message: "Email already registered" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = await User.create({
      first_name,
      last_name,
      email,
      phone,
      password: hashedPassword,
      role: role || "customer",
    });

    // generate jsonwebtoken and return it
    const token = jwt.sign(
      {
        userId: user.id,
        role: user.role,
      },
      process.env.JWT_SECRET || "secret",
      { expiresIn: "1d" }
    );

    // Store token and expiry
    const tokenExpiry = new Date();
    tokenExpiry.setDate(tokenExpiry.getDate() + 1); // 1 day from now

    await user.update({
      token: token,
      token_expiry: tokenExpiry,
    });

    res.status(201).json({
      message: "User registered successfully",
      token,
      userId: user.id,
    });
  } catch (err) {
    console.error("Registration error:", err);
    res.status(500).json({
      message: "Registration failed",
      error: err.message,
    });
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ where: { email } });

    if (!user) {
      return res.status(401).json({ message: "User not found" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const token = jwt.sign(
      {
        userId: user.id,
        role: user.role,
      },
      process.env.JWT_SECRET || "your_jwt_secret",
      { expiresIn: "1d" }
    );

    // Store token and expiry
    const tokenExpiry = new Date();
    tokenExpiry.setDate(tokenExpiry.getDate() + 1); // 1 day from now

    await user.update({
      token: token,
      token_expiry: tokenExpiry,
    });

    // Remove password from user object
    const userResponse = user.toJSON();
    delete userResponse.password;

    res.json({
      message: "Login successful",
      token,
      user: userResponse,
    });
  } catch (err) {
    console.error("Login error:", err);
    res.status(500).json({
      message: "Login failed",
      error: err.message,
    });
  }
};

exports.validateToken = async (req, res) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];

    if (!token) {
      return res.status(401).json({ message: "No token provided" });
    }

    // Find user with this token
    const user = await User.findOne({
      where: {
        token: token,
        token_expiry: {
          [sequelize.Op.gt]: new Date(), // token_expiry > current time
        },
      },
      attributes: { exclude: ["password"] }, // Don't send password
    });

    if (!user) {
      return res.status(401).json({ message: "Invalid or expired token" });
    }

    // Verify JWT
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    if (decoded.userId !== user.id) {
      return res.status(401).json({ message: "Invalid token" });
    }

    res.json({
      message: "Token is valid",
      user: user,
    });
  } catch (err) {
    if (err.name === "JsonWebTokenError" || err.name === "TokenExpiredError") {
      return res.status(401).json({ message: "Invalid or expired token" });
    }

    console.error("Token validation error:", err);
    res.status(500).json({
      message: "Token validation failed",
      error: err.message,
    });
  }
};

exports.logout = async (req, res) => {
  try {
    const token = req.headers.authorization?.split(" ")[1];

    if (!token) {
      return res.status(401).json({ message: "No token provided" });
    }

    // Find and update user
    const user = await User.findOne({ where: { token: token } });

    if (user) {
      await user.update({
        token: null,
        token_expiry: null,
      });
    }

    res.json({ message: "Logged out successfully" });
  } catch (err) {
    console.error("Logout error:", err);
    res.status(500).json({
      message: "Logout failed",
      error: err.message,
    });
  }
};
