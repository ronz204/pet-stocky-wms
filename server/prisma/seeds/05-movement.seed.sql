-- Movement Seed Data
-- Run this last (depends on products, stocks, and locations)

INSERT INTO "stocky"."movements" ("id", "quantity", "type", "productId", "stockId", "fromLocationId", "toLocationId", "createdAt", "updatedAt") VALUES
-- INBOUND movements (receiving inventory)
(1, 50, 'INBOUND', 1, 1, NULL, 1, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
(2, 100, 'INBOUND', 3, 4, NULL, 3, NOW() - INTERVAL '9 days', NOW() - INTERVAL '9 days'),
(3, 500, 'INBOUND', 5, 6, NULL, 11, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),
(4, 300, 'INBOUND', 6, 7, NULL, 11, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days'),
(5, 40, 'INBOUND', 7, 9, NULL, 7, NOW() - INTERVAL '7 days', NOW() - INTERVAL '7 days'),
(6, 200, 'INBOUND', 13, 15, NULL, 6, NOW() - INTERVAL '6 days', NOW() - INTERVAL '6 days'),
-- OUTBOUND movements (sales, shipments)
(7, 10, 'OUTBOUND', 1, 1, 1, NULL, NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
(8, 25, 'OUTBOUND', 3, 4, 3, NULL, NOW() - INTERVAL '4 days', NOW() - INTERVAL '4 days'),
(9, 50, 'OUTBOUND', 5, 6, 11, NULL, NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days'),
(10, 20, 'OUTBOUND', 11, 13, 9, NULL, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
-- TRANSFER movements (internal relocations)
(11, 15, 'TRANSFER', 1, 2, 1, 2, NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
(12, 25, 'TRANSFER', 4, 5, 3, 3, NOW() - INTERVAL '4 days', NOW() - INTERVAL '4 days'),
(13, 100, 'TRANSFER', 6, 8, 11, 12, NOW() - INTERVAL '3 days', NOW() - INTERVAL '3 days'),
(14, 5, 'TRANSFER', 7, 19, 7, 8, NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days'),
-- Recent movements
(15, 20, 'INBOUND', 2, 20, NULL, 15, NOW() - INTERVAL '1 day', NOW() - INTERVAL '1 day'),
(16, 30, 'OUTBOUND', 9, 11, 4, NULL, NOW() - INTERVAL '12 hours', NOW() - INTERVAL '12 hours'),
(17, 10, 'OUTBOUND', 12, 14, 9, NULL, NOW() - INTERVAL '6 hours', NOW() - INTERVAL '6 hours');

-- Reset sequence
SELECT setval('"stocky"."movements_id_seq"', (SELECT MAX(id) FROM "stocky"."movements"));
