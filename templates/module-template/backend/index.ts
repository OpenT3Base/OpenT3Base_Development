// Basic Express server for {{MODULE_NAME}} backend (placeholder)
import express from 'express';

const app = express();
app.use(express.json());

// Example: Get {{RESOURCE_NAME_PLURAL}}
app.get('/{{RESOURCE_PATH}}', (req, res) => {
  res.json([{ id: 1, name: "Example {{RESOURCE_NAME}}" }]);
});

// Example: Create a {{RESOURCE_NAME}}
app.post('/{{RESOURCE_PATH}}', (req, res) => {
  // TODO: Validate and store {{RESOURCE_NAME}}
  res.status(201).json({ message: "{{RESOURCE_NAME}} created" });
});

app.listen({{PORT}}, () => {
  console.log('{{MODULE_NAME}} backend running on port {{PORT}}');
});