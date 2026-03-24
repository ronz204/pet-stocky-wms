-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "stocky";

-- CreateEnum
CREATE TYPE "stocky"."MovementType" AS ENUM ('INBOUND', 'OUTBOUND', 'TRANSFER');

-- CreateEnum
CREATE TYPE "stocky"."StockStatus" AS ENUM ('AVAILABLE', 'RESERVED');

-- CreateTable
CREATE TABLE "stocky"."locations" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "maxWeight" DECIMAL(65,30),
    "maxVolume" DECIMAL(65,30),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "wereHouseId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "locations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."movements" (
    "id" SERIAL NOT NULL,
    "type" "stocky"."MovementType" NOT NULL,
    "quantity" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "productId" INTEGER NOT NULL,
    "stockLotId" INTEGER,
    "fromLocationId" INTEGER,
    "toLocationId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "movements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."products" (
    "id" SERIAL NOT NULL,
    "sku" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "uow" TEXT NOT NULL DEFAULT 'UNIT',
    "weight" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "volume" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "height" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "width" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "depth" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."stock_lots" (
    "id" SERIAL NOT NULL,
    "productId" INTEGER NOT NULL,
    "locationId" INTEGER NOT NULL,
    "quantity" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "status" "stocky"."StockStatus" NOT NULL DEFAULT 'AVAILABLE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "stock_lots_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."warehouses" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "warehouses_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "products_sku_key" ON "stocky"."products"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "warehouses_code_key" ON "stocky"."warehouses"("code");

-- AddForeignKey
ALTER TABLE "stocky"."locations" ADD CONSTRAINT "locations_wereHouseId_fkey" FOREIGN KEY ("wereHouseId") REFERENCES "stocky"."warehouses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_productId_fkey" FOREIGN KEY ("productId") REFERENCES "stocky"."products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_stockLotId_fkey" FOREIGN KEY ("stockLotId") REFERENCES "stocky"."stock_lots"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_fromLocationId_fkey" FOREIGN KEY ("fromLocationId") REFERENCES "stocky"."locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_toLocationId_fkey" FOREIGN KEY ("toLocationId") REFERENCES "stocky"."locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."stock_lots" ADD CONSTRAINT "stock_lots_productId_fkey" FOREIGN KEY ("productId") REFERENCES "stocky"."products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."stock_lots" ADD CONSTRAINT "stock_lots_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "stocky"."locations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
