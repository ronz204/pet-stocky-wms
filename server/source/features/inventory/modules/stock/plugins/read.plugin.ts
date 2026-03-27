import { Elysia } from "elysia";
import { PrismaPlugin } from "@database/prisma.plugin";
import { ReadStockQuery } from "../schemas/read.schema";
import { ReadStockResponse } from "../schemas/read.schema";
import { ReadStockHandler } from "../handlers/read.handler";

export const ReadStockPlugin = new Elysia({ name: "read.stock" })
  .use(PrismaPlugin)

  .decorate(({ prisma }) => ({
    readSH: new ReadStockHandler(prisma),
  }))
  
  .get("/stock", async ({ query, status, readSH }) => {
    console.log(query);
    const response = await readSH.handle({ query });
    return status(200, response);
  }, {
    query: ReadStockQuery,
    response: { 200: ReadStockResponse },
  });
