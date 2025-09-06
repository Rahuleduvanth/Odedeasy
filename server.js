const express = require('express');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());

// ✅ Serve static files (CSS, JS, images, HTML)
app.use(express.static(path.join(__dirname, '../frontend')));

const products = [
  { id: 1, name: 'Asus Rog Strix G16', price: 96000, description: 'High-performance gaming laptop...', image: '/images/rog.jpg' },
  { id: 2, name: 'Lenovo Loq', price: 70000, description: 'Reliable laptop for professionals...', image: '/images/loq.jpg' },
  { id: 3, name: 'HP Victus', price: 69000, description: 'Gaming and productivity laptop...', image: '/images/hp_victus.jpg' },
  { id: 4, name: 'Mac Book 2022', price: 65000, description: 'Elegant M-series Apple laptop ...', image: '/images/macbook.jpeg' },
  { id: 5, name: 'RTX 5090', price: 100500, description: 'Next-gen NVIDIA graphics card...', image: '/images/rtx5090.jpg' },
  { id: 6, name: 'RTX 3050', price: 14500, description: 'Affordable entry-level NVIDIA GPU...', image: '/images/rtx3050.jpg' }
];

// ✅ Get all products
app.get('/api/products', (req, res) => {
  res.json(products);
});

// ✅ Get product details by ID
app.get('/api/products/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const product = products.find(p => p.id === id);
  if (!product) return res.status(404).json({ error: 'Product not found' });
  res.json(product);
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`✅ Backend server running at http://localhost:${PORT}`);
});
