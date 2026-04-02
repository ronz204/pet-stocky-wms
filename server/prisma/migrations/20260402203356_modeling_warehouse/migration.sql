-- CreateTable
CREATE TABLE "stocky"."warehouses" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "districtId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "warehouses_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "warehouses_code_key" ON "stocky"."warehouses"("code");

-- AddForeignKey
ALTER TABLE "stocky"."warehouses" ADD CONSTRAINT "warehouses_districtId_fkey" FOREIGN KEY ("districtId") REFERENCES "stocky"."districts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
