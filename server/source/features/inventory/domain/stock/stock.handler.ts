import { PrismaClient } from "@prisma/client";
import { StockLotSpecify } from "./stock.specify";

import type { Handler } from "@contracts/handler.contract";
import type { StockLotRequest } from "./stock.schema";
import type { StockLotResponse } from "./stock.schema";

export class StockLotHandler implements Handler<StockLotRequest, StockLotResponse> {
  public constructor(private prisma: PrismaClient) {};

  public async handle(request: StockLotRequest): Promise<StockLotResponse> {
    const query = new StockLotSpecify(request).toQuery();

    const [aggre, stocks] = await Promise.all([
      this.prisma.stockLot.aggregate({
        where: query.where,
        _sum: { quantity: true },
        _count: { id: true },
      }),
      this.prisma.stockLot.findMany(query)
    ]);

    return {
      totalItems: aggre._count.id,
      totalQuantity: aggre._sum.quantity?.toNumber() || 0,
      items: stocks.map((stock) => ({
        sku: stock.product.sku,
        name: stock.product.name,
        location: stock.location.code,
        warehouse: stock.location.wereHouse.name,
        quantity: stock.quantity.toNumber(),
        stockLotId: stock.id,
        status: stock.status,
      }))
    };
  };
};
