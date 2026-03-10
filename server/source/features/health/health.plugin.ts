import { Elysia } from "elysia";

export const HealthPlugin = new Elysia({ name: "health.plugin", prefix: "/api/health" })
  .get("/", () => ({
    status: "healthy",
    service: "stocky",
  }));
