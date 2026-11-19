// T-01 — Ouverture de la base locale et migration du schéma (tables project, task).
import * as SQLite from "expo-sqlite";
import init from "./001_init.sql";

export async function openDatabase() {
  const db = await SQLite.openDatabaseAsync("suivi.db");
  await db.execAsync("PRAGMA foreign_keys = ON;");
  await db.execAsync(init);
  return db;
}
