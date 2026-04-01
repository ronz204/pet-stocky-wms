import { Elysia } from "elysia";

const name: string = "health.plugin";

export const HealthPlugin = new Elysia({ name })
  .get("/health", () => ({ status: "healthy", service: "stocky" }));
