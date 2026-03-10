-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "graphql";

-- CreateTable
CREATE TABLE "graphql"."users" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_name_key" ON "graphql"."users"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "graphql"."users"("email");
