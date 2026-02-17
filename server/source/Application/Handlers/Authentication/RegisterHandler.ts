import type { Handler } from "@Handlers/Handler";
import type { RegisterCommand } from "./RegisterSchema";
import type { RegisterResponse } from "./RegisterSchema";

export class RegisterHandler implements Handler<RegisterCommand, RegisterResponse> {
  constructor() {};

  public async handle(input: RegisterCommand): Promise<RegisterResponse> {
    console.log(input.email);
    console.log(input.password);
    console.log(input.username);

    return { message: "Registration successful" };
  };
};
