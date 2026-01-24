import { yoga } from "@elysiajs/graphql-yoga";
import { cors } from "@elysiajs/cors";
import { Elysia, t } from "elysia";

const schema = /* GraphQL */`
  type Query {
    hello: String
  }
`;

const app = new Elysia()
  .env(t.Object({
    PORT: t.Number(),
  }))
  .use(cors({ origin: "*" }))
  .get("/", () => {
    return { message: "Hello Elysia" };
  })
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
