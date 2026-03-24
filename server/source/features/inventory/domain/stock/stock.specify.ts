import { Specify } from "@contracts/specify.contract";
import type { StockLotRequest } from "./stock.schema";
import type { StockLotFindManyArgs } from "@prisma/models";

export class StockLotSpecify extends Specify {
  constructor(private args: StockLotRequest) {super()};

  public override toQuery() {
    return {
      where: {
        productId: this.args.params.productId,
        location: {
          code: this.args.params.locationCode,
          wereHouseId: this.args.params.werehouseId,
        },
      },
      include: {
        product: true,
        location: {
          include: {
            wereHouse: true,
          },
        },
      },
    } as const satisfies StockLotFindManyArgs;
  };
};
