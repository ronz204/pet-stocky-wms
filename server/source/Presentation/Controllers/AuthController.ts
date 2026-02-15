import { Elysia, type ElysiaConfig } from "elysia";

const config: ElysiaConfig<"/auth"> = {
  prefix: "/auth", name: "auth-controller",
};

export const AuthController = new Elysia(config)
  .post("/login", async () => ({ message: "Login successful" }))
  .post("/register", async () => ({ message: "Registration successful" }));
