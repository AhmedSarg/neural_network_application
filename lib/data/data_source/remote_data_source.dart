import '../network/app_api.dart';

abstract class RemoteDataSource {
  // Future<NewsListResponse> getNews();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  // @override
  // Future<NewsListResponse> getNews() async {
  //   return await _appServiceClient.getNews();
  // }

}
