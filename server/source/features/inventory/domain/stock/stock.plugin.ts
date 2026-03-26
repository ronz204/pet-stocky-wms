import { Elysia } from "elysia";
import { StockLotSchema } from "./stock.schema";
import { StockLotHandler } from "./stock.handler";
import { PrismaPlugin } from "@database/prisma.plugin";

export const StockPlugin = new Elysia({ name: "stock.plugin" })
  .use(PrismaPlugin)
  
  .decorate(({ prisma }) => ({
    stockH: new StockLotHandler(prisma),
  }))
  
  .get("/stock", async ({ params, status, stockH }) => {
    const response = await stockH.handle({ params });
    return status(200, response);
  }, {
    params: StockLotSchema.params,
    response: StockLotSchema.response,
  });
