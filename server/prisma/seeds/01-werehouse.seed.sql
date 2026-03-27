-- Warehouse Seed Data
-- Run this first (no dependencies)

INSERT INTO "stocky"."warehouses" ("id", "name", "createdAt", "updatedAt") VALUES
(1, 'Main Distribution Center', NOW(), NOW()),
(2, 'North Regional Warehouse', NOW(), NOW()),
(3, 'Cold Storage Facility', NOW(), NOW());

-- Reset sequence
SELECT setval('"stocky"."warehouses_id_seq"', (SELECT MAX(id) FROM "stocky"."warehouses"));
