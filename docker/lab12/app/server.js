const express = require("express");
const { Pool } = require("pg");
const { createClient } = require("redis");

const app = express();
const port = 3000;

const pool = new Pool({ connectionString: process.env.DATABASE_URL });

let redis;
(async () => {
  redis = createClient({ url: process.env.REDIS_URL || "redis://redis:6379" });
  await redis.connect();
})();

app.get("/health", (req, res) => {
  res.json({ status: "healthy" });
});

app.get("/", async (req, res) => {
  const visits = await redis.incr("visits");
  res.json({ message: "Hello from Lab 12!", visits });
});

app.get("/db", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW() as time");
    res.json({ db_time: result.rows[0].time });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
