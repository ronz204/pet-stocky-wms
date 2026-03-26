import { Elysia } from "elysia";
import { StockPlugin } from "./domain/stock/stock.plugin";

export const InventoryPlugin = new Elysia({ name: "inventory.plugin" })
  .use(StockPlugin);
