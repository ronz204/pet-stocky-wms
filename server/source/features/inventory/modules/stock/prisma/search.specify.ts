import { Specify } from "@contracts/specify.contract";
import type { StockWhereInput } from "@prisma/models";

interface SpecifyArgs {
  productId?: number;
  warehouseId?: number;
  locationCode?: string;
};

export class SearchStockSpecify extends Specify {
  constructor(private readonly args: SpecifyArgs = {}) {super()};

  public override toQuery() {
    return {
      productId: this.args.productId,
      location: {
        code: this.args.locationCode,
        werehouseId: this.args.warehouseId,
      },
    } as const satisfies StockWhereInput;
  };
};
