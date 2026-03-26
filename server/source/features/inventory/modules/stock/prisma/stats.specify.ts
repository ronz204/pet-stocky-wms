import { Specify } from "@contracts/specify.contract";
import { SearchStockSpecify } from "./search.specify";
import type { StockAggregateArgs } from "@prisma/models";
import type { ReadStockRequest } from "../schemas/read.schema";

export class StatsStockSpecify extends Specify {
  constructor(private readonly args: ReadStockRequest) {super()};

  public override toQuery() {
    const where = new SearchStockSpecify(this.args.params);

    return {
      where: where.toQuery(),
      _count: { id: true },
      _sum: { quantity: true },
    } as const satisfies StockAggregateArgs;
  };
};
