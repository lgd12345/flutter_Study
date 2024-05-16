class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    print(ticks);
    //return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
    //    .take(ticks);
    return Stream.periodic(const Duration(seconds: 1), (x) {
      // // print(x);
      // print(ticks - x - 1);
      return ticks - x - 1;
    })
        .take(ticks);
  }
}
