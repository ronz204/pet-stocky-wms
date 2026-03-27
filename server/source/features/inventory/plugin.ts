import { Elysia, type ElysiaConfig } from "elysia";
import { StockPlugin } from "./modules/stock/plugin";

const config: ElysiaConfig<"/inventory"> = {
  prefix: "/inventory", name: "inventory.plugin"
};

export const InventoryPlugin = new Elysia(config)
  .use(StockPlugin);
