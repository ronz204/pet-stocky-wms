import { Elysia, type ElysiaConfig, t } from "elysia";

import { LoginSchema } from "@Handlers/Authentication/LoginSchema";
import { LoginHandler } from "@Handlers/Authentication/LoginHandler";

const loginHandler = new LoginHandler();

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
    console.log(body.email);
    console.log(body.password);
    console.log(body.username);

    return { message: "Registration successful" };
  }, {
    body: t.Object({
      email: t.String(),
      password: t.String(),
      username: t.String(),
    }),
  });
