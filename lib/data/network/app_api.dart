import 'package:dio/dio.dart';

// part 'app_api.g.dart';
//
// @RestApi(baseUrl: Constants.baseUrl)
// abstract class AppServiceClient {
//   factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
//
//   @POST("/API/scanQR_app.php")
//   Future<ScanCodeResponse> scan(@Field("code") String code);
// }

// const String _newsEndPoint = "/API/news.php";

abstract class AppServiceClient {

  // Future<NewsListResponse> getNews();

}

class AppServiceClientImpl implements AppServiceClient {
  final Dio _dio;

  AppServiceClientImpl(this._dio);

  // @override
  // Future<NewsListResponse> getNews() async {
  //   Response response = await _dio.post(
  //     _newsEndPoint,
  //   );
  //
  //   var data = const Utf8Codec().decode(response.data).toString();
  //   return NewsListResponse.fromJson(jsonDecode(data));
  // }

}
