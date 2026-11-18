import "dotenv/config";

const applicationDatabase = process.env.PGDATABASE;

if (!applicationDatabase) {
  throw new Error("PGDATABASE must name the development database.");
}

process.env.NODE_ENV = "test";
process.env.PGDATABASE = `${applicationDatabase}_test`;

const { ensureDatabaseSchema } = await import("../db/schema.js");

await ensureDatabaseSchema();
