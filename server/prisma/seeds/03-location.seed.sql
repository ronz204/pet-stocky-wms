-- Location Seed Data
-- Run this third (depends on warehouses)

INSERT INTO "stocky"."locations" ("id", "code", "isActive", "maxWeight", "maxVolume", "werehouseId", "createdAt", "updatedAt") VALUES
-- Main Distribution Center locations
(1, 'MDC-A01-L01-P01', true, 1000.00, 10.00, 1, NOW(), NOW()),
(2, 'MDC-A01-L01-P02', true, 1000.00, 10.00, 1, NOW(), NOW()),
(3, 'MDC-A01-L02-P01', true, 800.00, 8.00, 1, NOW(), NOW()),
(4, 'MDC-A02-L01-P01', true, 1500.00, 15.00, 1, NOW(), NOW()),
(5, 'MDC-A02-L01-P02', true, 1500.00, 15.00, 1, NOW(), NOW()),
(6, 'MDC-B01-L01-P01', true, 500.00, 5.00, 1, NOW(), NOW()),
-- North Regional Warehouse locations
(7, 'NRW-A01-L01-P01', true, 1200.00, 12.00, 2, NOW(), NOW()),
(8, 'NRW-A01-L02-P01', true, 1200.00, 12.00, 2, NOW(), NOW()),
(9, 'NRW-A02-L01-P01', true, 900.00, 9.00, 2, NOW(), NOW()),
(10, 'NRW-B01-L01-P01', true, 600.00, 6.00, 2, NOW(), NOW()),
-- Cold Storage Facility locations
(11, 'CSF-C01-L01-P01', true, 2000.00, 20.00, 3, NOW(), NOW()),
(12, 'CSF-C01-L01-P02', true, 2000.00, 20.00, 3, NOW(), NOW()),
(13, 'CSF-C02-L01-P01', true, 1800.00, 18.00, 3, NOW(), NOW()),
(14, 'CSF-C02-L02-P01', true, 1800.00, 18.00, 3, NOW(), NOW()),
-- Receiving/Shipping areas
(15, 'MDC-RECV-01', true, 5000.00, 50.00, 1, NOW(), NOW()),
(16, 'MDC-SHIP-01', true, 5000.00, 50.00, 1, NOW(), NOW());

-- Reset sequence
SELECT setval('"stocky"."locations_id_seq"', (SELECT MAX(id) FROM "stocky"."locations"));
