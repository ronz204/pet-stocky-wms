export abstract class Specify {
  private DEFAULT_PAGE = 1;
  private DEFAULT_LIMIT = 10;

  public abstract toQuery(): any;

  public usePagination(args: any) {
    const page = args.page ?? this.DEFAULT_PAGE;
    const limit = args.limit ?? this.DEFAULT_LIMIT;

    const skip = (page - 1) * limit;
    return { skip, take: limit };
  };
};
