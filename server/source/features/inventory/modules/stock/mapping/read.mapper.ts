import type { StockGetPayload } from "@prisma/models";
import type { GetStockAggregateType } from "@prisma/models";
import type { ReadStockResponse } from "../schemas/read.schema";

import { ReadStockSpecify } from "../prisma/read.specify";
import { StatsStockSpecify } from "../prisma/stats.specify";

type ReadStockQuery = ReturnType<typeof ReadStockSpecify.prototype.toQuery>;
type ReadStockPayload = StockGetPayload<ReadStockQuery>;

type StatsStockQuery = ReturnType<typeof StatsStockSpecify.prototype.toQuery>;
type StatsStockPayload = GetStockAggregateType<StatsStockQuery>;

interface MapData {
  data: ReadStockPayload[];
  stats: StatsStockPayload;
};

export class ReadStockMapper {
  public static toResponse({ data, stats }: MapData): ReadStockResponse {
    return {
      totalItems: stats._count.id,
      totalQuantity: stats._sum.quantity?.toNumber() ?? 0,
      items: data.map((item) => ({
        sku: item.product.sku,
        name: item.product.name,
        quantity: item.quantity.toNumber(),
        status: item.status,
        warehouse: item.location.warehouse.name,
        location: item.location.code,
        stocklotId: item.id,
      })),
    } as const;
  };
};
