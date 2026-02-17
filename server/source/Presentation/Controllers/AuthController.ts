import { Elysia, type ElysiaConfig, t } from "elysia";

import { LoginSchema } from "@Handlers/Authentication/LoginSchema";
import { LoginHandler } from "@Handlers/Authentication/LoginHandler";

import { RegisterSchema } from "@Handlers/Authentication/RegisterSchema";
import { RegisterHandler } from "@Handlers/Authentication/RegisterHandler";

const loginHandler = new LoginHandler();
const registerHandler = new RegisterHandler();

const config: ElysiaConfig<"/auth"> = {
  prefix: "/auth", name: "auth-controller",
};

export const AuthController = new Elysia(config)
  .post("/login", async ({ body }) => {
    return await loginHandler.handle(body)
  }, {
    body: LoginSchema
  })
  .post("/register", async ({ body }) => {
    return await registerHandler.handle(body);
  }, {
    body: RegisterSchema,
  });
