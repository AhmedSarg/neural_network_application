part 'responses.g.dart';

// //Home Screen
// @JsonSerializable()
// class NewsItemResponse {
//   @JsonKey(name: "id")
//   int? id;
//   @JsonKey(name: "title")
//   String? title;
//   @JsonKey(name: "description")
//   String? desc;
//   @JsonKey(name: "img")
//   String? img;
//
//   factory NewsItemResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewsItemResponseFromJson(json);
//
//   NewsItemResponse(this.id, this.title, this.desc, this.img);
//
//   Map<String, dynamic> toJson() => _$NewsItemResponseToJson(this);
// }
//
// @JsonSerializable()
// class NewsListResponse {
//   @JsonKey(name: "News")
//   List<NewsItemResponse?>? news;
//
//   factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewsListResponseFromJson(json);
//
//   NewsListResponse(this.news);
//
//   Map<String, dynamic> toJson() => _$NewsListResponseToJson(this);
// }
