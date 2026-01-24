import { yoga } from "@elysiajs/graphql-yoga";
import { cors } from "@elysiajs/cors";
import { Elysia } from "elysia";

const app = new Elysia();

app.use(cors({ origin: "*" }));

app.get("/", () => {
  return { message: "Hello Elysia" };
});

const schema = /* GraphQL */`
  type Query {
    hello: String
  }
`;

app.use(yoga({
  typeDefs: schema,
  resolvers: {
    Query: {
      hello: () => "Hello from GraphQL Yoga with Elysia!"
    }
  },
}));

app.listen(3000);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);
