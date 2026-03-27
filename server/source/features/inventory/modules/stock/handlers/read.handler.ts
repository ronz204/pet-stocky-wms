import { PrismaClient } from "@prisma/client";
import { ReadStockMapper } from "../mapping/read.mapper";
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

    return ReadStockMapper.toResponse(data, stats);
  };
};
