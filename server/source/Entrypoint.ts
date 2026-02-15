import { yoga } from "@elysiajs/graphql-yoga";
import { cors } from "@elysiajs/cors";
import { Elysia } from "elysia";

import { HealthController } from "@Controllers/HealthController";

const schema = /* GraphQL */`
  type Query {
    hello: String
  }
`;

const app = new Elysia()
  .use(cors({ origin: "*" }))
  .use(HealthController)
  .use(yoga({
    typeDefs: schema,
    resolvers: {
      Query: {
        hello: () => "Hello from GraphQL Yoga with Elysia!"
      }
    },
  }))
  .listen(process.env.PORT!);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);

/* .get("/prisma", async () => {
    const users = await Prisma.user.findMany();
    return { users };
  }) */
