-- Stock Seed Data
-- Run this fourth (depends on products and locations)

INSERT INTO "stocky"."stocks" ("id", "productId", "locationId", "quantity", "status", "createdAt", "updatedAt") VALUES
-- Electronics in Main Distribution Center
(1, 1, 1, 25, 'AVAILABLE', NOW(), NOW()),
(2, 1, 2, 15, 'AVAILABLE', NOW(), NOW()),
(3, 2, 1, 40, 'AVAILABLE', NOW(), NOW()),
(4, 3, 3, 150, 'AVAILABLE', NOW(), NOW()),
(5, 4, 3, 200, 'AVAILABLE', NOW(), NOW()),
-- Food items in Cold Storage
(6, 5, 11, 500, 'AVAILABLE', NOW(), NOW()),
(7, 6, 11, 300, 'AVAILABLE', NOW(), NOW()),
(8, 6, 12, 250, 'AVAILABLE', NOW(), NOW()),
-- Tools in North Regional Warehouse
(9, 7, 7, 35, 'AVAILABLE', NOW(), NOW()),
(10, 8, 8, 80, 'AVAILABLE', NOW(), NOW()),
-- Home goods distributed
(11, 9, 4, 120, 'AVAILABLE', NOW(), NOW()),
(12, 10, 5, 60, 'AVAILABLE', NOW(), NOW()),
-- Sports items
(13, 11, 9, 45, 'AVAILABLE', NOW(), NOW()),
(14, 12, 9, 75, 'AVAILABLE', NOW(), NOW()),
-- Books and toys
(15, 13, 6, 200, 'AVAILABLE', NOW(), NOW()),
(16, 14, 6, 50, 'AVAILABLE', NOW(), NOW()),
-- Chemicals
(17, 15, 10, 100, 'AVAILABLE', NOW(), NOW()),
-- Reserved stock examples
(18, 1, 4, 10, 'RESERVED', NOW(), NOW()),
(19, 7, 8, 5, 'RESERVED', NOW(), NOW()),
-- Receiving area stock (temporary)
(20, 2, 15, 20, 'AVAILABLE', NOW(), NOW());

-- Reset sequence
SELECT setval('"stocky"."stocks_id_seq"', (SELECT MAX(id) FROM "stocky"."stocks"));
