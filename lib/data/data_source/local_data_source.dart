import '../network/assets_loader.dart';

abstract class LocalDataSource {
  // Future<NewsListResponse> getNewsData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final AssetsLoader _assetLoader;

  LocalDataSourceImpl(this._assetLoader);

  // @override
  // Future<NewsListResponse> getNewsData() async {
  //   Map<String, dynamic> data = await _assetLoader.getNewsData();
  //   return NewsListResponse.fromJson(data);
  // }
}
