import { Elysia } from "elysia";
import { PrismaPlugin } from "@database/prisma.plugin";
import { ReadStockPlugin } from "./plugins/read.plugin";

export const StockPlugin = new Elysia({ name: "stock.plugin" })
  .use(PrismaPlugin).use(ReadStockPlugin);
