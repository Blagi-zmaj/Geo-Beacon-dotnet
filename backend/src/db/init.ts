import { pool } from "./pool.js";
import { ensureDatabaseSchema } from "./schema.js";

const initializeDatabase = async () => {
  try {
    await ensureDatabaseSchema();
    console.log("Table and indexes created!");
  } catch (error) {
    console.log("Error during table or indexes creation:", error);
  } finally {
    await pool.end();
  }
};

await initializeDatabase();
