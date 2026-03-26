import { PrismaClient } from "@prisma/client";
import { ReadStockSpecify } from "../prisma/read.specify";
import { StatsStockSpecify } from "../prisma/stats.specify";

import type { Handler } from "@contracts/handler.contract";
import type { ReadStockRequest } from "../schemas/read.schema";
import type { ReadStockResponse } from "../schemas/read.schema";

export class ReadStockHandler implements Handler<ReadStockRequest, ReadStockResponse> {
  constructor(private prisma: PrismaClient) {};

  public async handle(request: ReadStockRequest): Promise<any> {
    const statsQuery = new StatsStockSpecify(request).toQuery();
    const readQuery = new ReadStockSpecify(request).toQuery();

    const [stats, data] = await Promise.all([
      this.prisma.stockLot.aggregate(statsQuery),
      this.prisma.stockLot.findMany(readQuery),
    ]);
  };
};
