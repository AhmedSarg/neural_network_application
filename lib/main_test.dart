//todo remove on RELEASE



void test() async {
  // SendOrderUseCase useCase = SendOrderUseCase(sl());
  //
  // var res = await useCase(SendOrderUseCaseInput(foodList: [
  //   FoodItemModel(foodName: "Burger", desc: "descriptions", quantity: 12),
  //   FoodItemModel(foodName: "Bread", desc: "bread desc", quantity: 123),
  //   FoodItemModel(foodName: "Rat", desc: "الفار الطباخ", quantity: 1),
  // ]));
  //
  // res.fold((l) {
  //   print("\n\n Error ${l.message} \n\n");
  // }, (r) {
  //   print("\n\n Success  \n\n");
  // });

  // GSheetFactory gSheetFactory = GSheetFactoryImpl();
  // var sheet = await gSheetFactory.create();
  // Worksheet ws =
  //     sheet.worksheetByTitle("test") ?? await sheet.addWorksheet("test");
  //
  // await ws.values.appendRow(["sda", 'dsa']);

  // ScanCodeUseCase _scan = ScanCodeUseCase(sl());
  // var s = await _scan.call(ScanCodeUseCaseInput(code: "123456789"));
  //
  // print("\n\n${s}");

  //test some code, DEV: Yosef Samy
  // var v = await sl<LocalDataSource>().getHomeData();

  // var r = await Dio().post(
  //   "https://ieee-bub.org/API/scanQR_app.php",
  //   options: Options(
  //     // headers: {"Content-type": "application/json"},
  //     responseType: ResponseType.bytes,
  //
  //   ),
  //   data: FormData.fromMap({"code": "123456789"}),
  //   // data: {"code": "123456789"},
  // );
  //
  // // var r = await http.post(
  // //     Uri.parse("https://ieee-bub.org/API/scanQR_app.php"),
  // //     body: {"code": "123456789"});
  //
  // // print("\n\nResponse: ${r.data}");
  // print(Utf8Codec().decode(r.data).toString());
}
