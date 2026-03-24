import { Elysia } from "elysia";
import { HealthPlugin } from "@features/health/health.plugin";
import { InventoryPlugin } from "@features/inventory/inventory.plugin";

const app = new Elysia({ prefix: "/api" })
  .use(HealthPlugin)
  .use(InventoryPlugin)
  .listen(process.env.PORT!);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);
