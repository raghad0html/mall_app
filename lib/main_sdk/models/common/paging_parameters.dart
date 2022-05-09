class PagingParameters {
  int limit;
  int skip;

  PagingParameters({
    this.skip = 1,
    this.limit = 10,
  });

  PagingParameters.model(PagingParameters pagingParameters)
      : limit = pagingParameters.limit,
        skip = pagingParameters.skip;

  Map<String, dynamic> toMap() {
    return {
      'skip': skip,
      'limit': limit,
    }..removeWhere((key, value) => value == null);
  }
}
