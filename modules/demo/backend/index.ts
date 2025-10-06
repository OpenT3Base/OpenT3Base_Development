// Basic Express server for Demo backend (placeholder)
import express from 'express';

const app = express();
app.use(express.json());

// Example: Get demos
app.get('/demos', (req, res) => {
  res.json([{ id: 1, name: "Example demo" }]);
});

// Example: Create a demo
app.post('/demos', (req, res) => {
  // TODO: Validate and store demo
  res.status(201).json({ message: "demo created" });
});

app.listen(3001, () => {
  console.log('Demo backend running on port 3001');
});