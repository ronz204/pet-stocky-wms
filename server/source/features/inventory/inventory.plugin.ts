import { Elysia } from "elysia";
import { StockPlugin } from "./modules/stock/stock.plugin";

export const InventoryPlugin = new Elysia({ name: "inventory.plugin" })
  .use(StockPlugin);
