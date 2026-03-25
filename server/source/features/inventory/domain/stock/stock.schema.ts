import { t, type Static } from "elysia";
import { StockStatus } from "@prisma/enums";

const StockLotDTO = t.Object({
  sku: t.String(),
  name: t.String(),
  location: t.String(),
  warehouse: t.String(),
  stockLotId: t.Number(),
  quantity: t.Number(),
  status: t.Enum(StockStatus),
});

const StockLotParams = t.Object({
  productId: t.Optional(t.Number()),
  werehouseId: t.Optional(t.Number()),
  locationCode: t.Optional(t.String()),
});

const StockLotRequest = t.Object({
  params: StockLotParams,
});

const StockLotResponse = t.Object({
  totalItems: t.Number(),
  totalQuantity: t.Number(),
  items: t.Array(StockLotDTO),
});

export const StockLotSchema = {
  params: StockLotParams,
  request: StockLotRequest,
  response: {
    200: StockLotResponse,
  },
} as const;

export type StockLotParams = Static<typeof StockLotParams>;
export type StockLotRequest = Static<typeof StockLotRequest>;
export type StockLotResponse = Static<typeof StockLotResponse>;
