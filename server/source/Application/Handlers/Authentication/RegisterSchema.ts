import { t } from "elysia";

export const RegisterSchema = t.Object({

  email: t.String(),
  password: t.String(),
  username: t.String(),
});

export type RegisterCommand = typeof RegisterSchema.static;

export type RegisterResponse = {
  message: string;
};
