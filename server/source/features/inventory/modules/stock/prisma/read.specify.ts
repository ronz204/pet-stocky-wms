import { Specify } from "@contracts/specify.contract";
import { SearchStockSpecify } from "./search.specify";
import type { StockFindManyArgs } from "@prisma/models";
import type { ReadStockRequest } from "../schemas/read.schema";

export class ReadStockSpecify extends Specify {
  constructor(private readonly args: ReadStockRequest) {super()};
  
  public override toQuery() {
    const where = new SearchStockSpecify(this.args.query);

    return {
      where: where.toQuery(),
      select: {
        id: true,
        status: true,
        quantity: true,

        product: {
          select: {
            sku: true,
            name: true,
          },
        },

        location: {
          select: {
            code: true,

            warehouse: {
              select: {
                name: true,
              },
            },
          },
        },
      },
    } as const satisfies StockFindManyArgs;
  };
};
