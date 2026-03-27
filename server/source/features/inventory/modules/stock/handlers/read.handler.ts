import { PrismaClient } from "@prisma/client";
import { ReadStockSpecify } from "../prisma/read.specify";
import { StatsStockSpecify } from "../prisma/stats.specify";

import type { Handler } from "@contracts/handler.contract";
import type { ReadStockRequest } from "../schemas/read.schema";
import type { ReadStockResponse } from "../schemas/read.schema";

export class ReadStockHandler implements Handler<ReadStockRequest, ReadStockResponse> {
  constructor(private prisma: PrismaClient) {};

  public async handle(request: ReadStockRequest): Promise<ReadStockResponse> {
    const statsQuery = new StatsStockSpecify(request).toQuery();
    const readQuery = new ReadStockSpecify(request).toQuery();

    const [stats, data] = await Promise.all([
      this.prisma.stock.aggregate(statsQuery),
      this.prisma.stock.findMany(readQuery),
    ]);

    return {
      totalItems: stats._count.id,
      totalQuantity: stats._sum.quantity?.toNumber() ?? 0,
      items: data.map((item) => ({
        sku: item.product.sku,
        name: item.product.name,
        quantity: item.quantity.toNumber(),
        status: item.status,
        warehouse: item.location.werehouse.name,
        location: item.location.code,
        stocklotId: item.id,
      })),
    };
  };
};
