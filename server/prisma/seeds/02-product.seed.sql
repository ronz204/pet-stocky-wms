-- Product Seed Data
-- Run this second (no dependencies)

INSERT INTO "stocky"."products" ("id", "sku", "name", "uom", "weight", "volume", "height", "width", "depth", "createdAt", "updatedAt") VALUES
(1, 'ELEC-LAP-001', 'Laptop Computer 15 inch', 'UNIT', 2.50, 0.008, 2.50, 35.00, 25.00, NOW(), NOW()),
(2, 'ELEC-MON-001', 'LED Monitor 27 inch', 'UNIT', 5.20, 0.045, 45.00, 65.00, 20.00, NOW(), NOW()),
(3, 'ELEC-KEY-001', 'Wireless Keyboard', 'UNIT', 0.80, 0.003, 3.00, 45.00, 15.00, NOW(), NOW()),
(4, 'ELEC-MOU-001', 'Wireless Mouse', 'UNIT', 0.15, 0.001, 4.00, 12.00, 7.00, NOW(), NOW()),
(5, 'FOOD-SNK-001', 'Potato Chips 200g', 'UNIT', 0.20, 0.002, 25.00, 18.00, 8.00, NOW(), NOW()),
(6, 'FOOD-BEV-001', 'Orange Juice 1L', 'LITER', 1.05, 0.001, 23.00, 9.00, 9.00, NOW(), NOW()),
(7, 'TOOL-DRL-001', 'Cordless Drill Kit', 'UNIT', 3.50, 0.012, 30.00, 35.00, 12.00, NOW(), NOW()),
(8, 'TOOL-HMR-001', 'Claw Hammer', 'UNIT', 0.60, 0.002, 32.00, 12.00, 5.00, NOW(), NOW()),
(9, 'HOME-TWL-001', 'Bath Towel Set', 'UNIT', 1.20, 0.008, 10.00, 30.00, 25.00, NOW(), NOW()),
(10, 'HOME-PLT-001', 'Dinner Plate Set 12pc', 'UNIT', 4.50, 0.015, 25.00, 35.00, 35.00, NOW(), NOW()),
(11, 'SPRT-BAL-001', 'Basketball Official Size', 'UNIT', 0.62, 0.007, 24.00, 24.00, 24.00, NOW(), NOW()),
(12, 'SPRT-SHO-001', 'Running Shoes Size 10', 'UNIT', 0.35, 0.004, 12.00, 32.00, 18.00, NOW(), NOW()),
(13, 'BOOK-FIC-001', 'Fiction Novel Hardcover', 'UNIT', 0.65, 0.002, 23.00, 16.00, 4.00, NOW(), NOW()),
(14, 'TOY-LEG-001', 'Building Blocks Set 500pc', 'UNIT', 2.80, 0.018, 30.00, 40.00, 15.00, NOW(), NOW()),
(15, 'CHEM-CLN-001', 'Multi-Surface Cleaner 5L', 'LITER', 5.20, 0.005, 28.00, 22.00, 15.00, NOW(), NOW());

-- Reset sequence
SELECT setval('"stocky"."products_id_seq"', (SELECT MAX(id) FROM "stocky"."products"));
