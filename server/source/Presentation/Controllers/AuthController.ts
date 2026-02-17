import { Elysia, type ElysiaConfig, t } from "elysia";

const config: ElysiaConfig<"/auth"> = {
  prefix: "/auth", name: "auth-controller",
};

export const AuthController = new Elysia(config)
  .post("/login", async ({ body }) => {
    console.log(body.email);
    console.log(body.password);

    return { message: "Login successful" };
  }, {
    body: t.Object({
      email: t.String(),
      password: t.String(),
    }),
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
