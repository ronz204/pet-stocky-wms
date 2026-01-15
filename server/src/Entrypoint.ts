import { yoga } from "@elysiajs/graphql-yoga";
import { Elysia } from "elysia";

const app = new Elysia();

app.get("/", () => {
  return { message: "Hello Elysia" };
});

const schema = /* GraphQL */`
  type Query {
    hi: String
  }
`;

app.use(yoga({
  typeDefs: schema,
  resolvers: {
    Query: {
      hi: () => "Hello from GraphQL Yoga with Elysia!"
    }
  },
}));

app.listen(3000);

const url = `http://${app.server?.hostname}:${app.server?.port}`;
console.log(`🦊 Elysia is running at ${url}`);
