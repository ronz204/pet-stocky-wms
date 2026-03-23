-- CreateEnum
CREATE TYPE "stocky"."MovementType" AS ENUM ('INBOUND', 'OUTBOUND', 'TRANSFER');

-- CreateTable
CREATE TABLE "stocky"."movements" (
    "id" TEXT NOT NULL,
    "type" "stocky"."MovementType" NOT NULL,
    "quantity" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "productId" TEXT NOT NULL,
    "stockLotId" TEXT,
    "fromLocationId" TEXT,
    "toLocationId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "movements_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_productId_fkey" FOREIGN KEY ("productId") REFERENCES "stocky"."products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_stockLotId_fkey" FOREIGN KEY ("stockLotId") REFERENCES "stocky"."stock_lots"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_fromLocationId_fkey" FOREIGN KEY ("fromLocationId") REFERENCES "stocky"."locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."movements" ADD CONSTRAINT "movements_toLocationId_fkey" FOREIGN KEY ("toLocationId") REFERENCES "stocky"."locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;
