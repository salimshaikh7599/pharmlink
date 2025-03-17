// backend/server.js
const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();
const sequelize = require('./config/sequelize');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from the uploads folder
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Routes
app.use('/api/auth', require('./routes/authRoutes'));
app.use('/api/products', require('./routes/productRoutes'));
app.use('/api/cart', require('./routes/cartRoutes'));
app.use('/api/orders', require('./routes/orderRoutes'));
app.use('/api/payment', require('./routes/paymentRoutes'));
app.use('/api/pharmacy', require('./routes/pharmacyRoutes'));
app.use('/api/admin', require('./routes/adminRoutes'));
app.use('/api/notifications', require('./routes/notificationsRoutes'));
app.use('/api/inventory', require('./routes/inventoryRoutes'));
app.use('/api/subscriptions', require('./routes/subscriptionsRoutes'));
app.use('/api/categories', require('./routes/categoriesRoutes'));
app.use('/api/manufacturers', require('./routes/manufacturersRoutes'));
app.use('/api/upload-csv', require('./routes/uploadCsvRoutes'));

// Error handling middleware
const { errorHandler } = require('./middleware/errorMiddleware');
app.use(errorHandler);

// Sync models with the database and start the server
sequelize.sync().then(() => {
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
    console.log("Database synced successfully");
  });
}).catch(err => {
  console.error("Error syncing database:", err);
});
