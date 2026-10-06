const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "familyvault",
  password: "26290123",
  port: 5432,
});

pool.on("connect", () => {
  console.log("PostgreSQL connected successfully");
});

pool.on("error", (err) => {
  console.error("Unexpected PostgreSQL error:", err);
});

module.exports = pool;