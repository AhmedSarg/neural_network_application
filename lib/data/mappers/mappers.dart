const fallbackString = "None";
const fallbackInt = -1;

int mapId(int? id) {
  return id ?? -1;
}

// extension NewsItemMapper on NewsItemResponse {
//   Future<NewsItemModel> toDomain() async {
//     return NewsItemModel(
//       id: mapId(id),
//       // img: mapImg('/news', img),
//       img: mapNetworkImg(img),
//       title: title ?? fallbackString,
//       desc: desc ?? fallbackString,
//     );
//   }
// }
//
// extension NewsListMapper on NewsListResponse {
//   Future<NewsListModel> toDomain() async {
//     List<NewsItemModel> list = [];
//     if (news != null) {
//       for (var item in news!) {
//         if (item != null) list.add(await item.toDomain());
//       }
//     }
//     return NewsListModel(
//       news: list,
//     );
//   }
// }
