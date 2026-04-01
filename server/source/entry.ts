import { Elysia } from "elysia";

const app = new Elysia({ prefix: "/api" })
  .listen(process.env.PORT!);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);
