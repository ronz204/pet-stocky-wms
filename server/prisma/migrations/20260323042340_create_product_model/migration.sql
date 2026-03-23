-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "stocky";

-- CreateTable
CREATE TABLE "stocky"."products" (
    "id" TEXT NOT NULL,
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

-- CreateIndex
CREATE UNIQUE INDEX "products_sku_key" ON "stocky"."products"("sku");
