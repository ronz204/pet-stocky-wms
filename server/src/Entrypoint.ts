import http from "http";
import cors from "cors";
import express from "express";
import { ApolloServer } from "@apollo/server";
import { expressMiddleware } from "@as-integrations/express5";
import { ApolloServerPluginDrainHttpServer } from "@apollo/server/plugin/drainHttpServer";

const app = express();
const server = http.createServer(app);

app.get("/ping", (req, res) => {
  res.status(200).json({ message: "pong" });
});

const typeDefs = `#graphql
  type Query {
    hello: String
  }
`;

const resolvers = {
  Query: {
    hello: () => "Hello, world!",
  },
};

const apollo = new ApolloServer({
  typeDefs, resolvers,
  plugins: [ApolloServerPluginDrainHttpServer({ httpServer: server })],
});

await apollo.start();

app.use(cors({ origin: "*" }));
app.use("/graphql", express.json(), expressMiddleware(apollo));

await new Promise<void>((resolve) => {
  server.listen({ port: 3000 }, resolve);
});

console.log("Server is running on http://localhost:3000");
console.log("GraphQL is running on http://localhost:3000/graphql");
