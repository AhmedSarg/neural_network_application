// class NewsListUseCase extends BaseUseCase<void, NewsListModel> {
//   final Repository _repository;
//
//   NewsListUseCase(this._repository);
//
//   @override
//   Future<Either<Failure, NewsListModel>> call(void input) async {
//     return _repository.getNewsList();
//   }
// }