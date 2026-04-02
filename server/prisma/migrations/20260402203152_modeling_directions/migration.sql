-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "stocky";

-- CreateTable
CREATE TABLE "stocky"."counties" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "provinceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "counties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."districts" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "countyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "districts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocky"."provinces" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "provinces_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "counties_name_key" ON "stocky"."counties"("name");

-- CreateIndex
CREATE UNIQUE INDEX "districts_name_key" ON "stocky"."districts"("name");

-- CreateIndex
CREATE UNIQUE INDEX "provinces_name_key" ON "stocky"."provinces"("name");

-- AddForeignKey
ALTER TABLE "stocky"."counties" ADD CONSTRAINT "counties_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "stocky"."provinces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocky"."districts" ADD CONSTRAINT "districts_countyId_fkey" FOREIGN KEY ("countyId") REFERENCES "stocky"."counties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
