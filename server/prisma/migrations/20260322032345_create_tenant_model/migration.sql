-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "stocky";

-- CreateTable
CREATE TABLE "stocky"."tenants" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "subdomain" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tenants_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tenants_name_key" ON "stocky"."tenants"("name");

-- CreateIndex
CREATE UNIQUE INDEX "tenants_subdomain_key" ON "stocky"."tenants"("subdomain");
