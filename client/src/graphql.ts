import { gql, GraphQLClient } from "graphql-request";

const endpoint = "https://countries.trevorblades.com/graphql";
const client = new GraphQLClient(endpoint);

const document = gql`
  query myQuery ($filter: [String!]) {
    countries (filter: { name: { in: $filter } }) {
      name
      continent {
        name
      }
    }
  }
`;

const variables = {
  filter: ["United States", "Canada", "Mexico"]
};

const data = await client.request(document, variables);
console.log(data);
