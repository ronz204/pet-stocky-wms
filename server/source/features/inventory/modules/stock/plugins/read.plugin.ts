import { Elysia } from "elysia";
import { PrismaPlugin } from "@database/prisma.plugin";
import { ReadStockParams } from "../schemas/read.schema";
import { ReadStockResponse } from "../schemas/read.schema";
import { ReadStockHandler } from "../handlers/read.handler";

export const ReadStockPlugin = new Elysia({ name: "read.stock" })
  .use(PrismaPlugin)

  .decorate(({ prisma }) => ({
    readSH: new ReadStockHandler(prisma),
  }))
  
  .get("/stock", async ({ params, status, readSH }) => {
    const response = await readSH.handle({ params });
    return status(200, response);
  }, {
    params: ReadStockParams,
    /* response: { 200: ReadStockResponse }, */
  });
