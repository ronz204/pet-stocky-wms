import { Elysia } from "elysia";
import { ScalarPlugin } from "@plugins/scalar.plugin";
import { HealthPlugin } from "@plugins/health.plugin";

const app = new Elysia({ prefix: "/api" })
  .use(HealthPlugin)
  .use(ScalarPlugin)
  .listen(process.env.PORT!);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);
