-- CreateTable
CREATE TABLE "stocky"."locations" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "maxWeight" DECIMAL(65,30),
    "maxVolume" DECIMAL(65,30),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "wereHouseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "locations_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "stocky"."locations" ADD CONSTRAINT "locations_wereHouseId_fkey" FOREIGN KEY ("wereHouseId") REFERENCES "stocky"."warehouses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
