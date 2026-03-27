import { t, type Static } from "elysia";
import { StockStatus } from "@prisma/enums";

const StockDTO = t.Object({
  sku: t.String(),
  name: t.String(),
  location: t.String(),
  warehouse: t.String(),
  stocklotId: t.Number(),
  quantity: t.Number(),
  status: t.Enum(StockStatus),
});

export const ReadStockQuery = t.Object({
  productId: t.Optional(t.Number()),
  warehouseId: t.Optional(t.Number()),
  locationCode: t.Optional(t.String()),
});

export const ReadStockRequest = t.Object({
  query: t.Optional(ReadStockQuery),
});

export const ReadStockResponse = t.Object({
  totalItems: t.Number(),
  totalQuantity: t.Number(),
  items: t.Array(StockDTO),
});

export type ReadStockQuery = Static<typeof ReadStockQuery>;
export type ReadStockRequest = Static<typeof ReadStockRequest>;
export type ReadStockResponse = Static<typeof ReadStockResponse>;
