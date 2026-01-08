import type { JSX } from "react";
import { gql } from "@apollo/client";
import { useQuery } from "@apollo/client/react";

interface HelloQueryData {
  hello: string;
};

const HELLO_QUERY = gql`
  query Hello {
    hello
  }
`;

export const PlaygroundPage = (): JSX.Element => {
  const { data, loading, error } = useQuery<HelloQueryData>(HELLO_QUERY);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  return <div className="font-bold underline">{data?.hello}</div>;
};
