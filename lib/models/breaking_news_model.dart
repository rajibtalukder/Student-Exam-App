import 'dart:convert';

class BreakingNewsModel {
  List<BreakingNew> breakingNews;

  BreakingNewsModel({
    required this.breakingNews,
  });

  factory BreakingNewsModel.fromRawJson(String str) => BreakingNewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) => BreakingNewsModel(
    breakingNews: List<BreakingNew>.from(json["breaking_news"].map((x) => BreakingNew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "breaking_news": List<dynamic>.from(breakingNews.map((x) => x.toJson())),
  };
}

class BreakingNew {
  int breakingNewsId;
  String breakingNews;
  String youtubePlayList;

  BreakingNew({
    required this.breakingNewsId,
    required this.breakingNews,
    required this.youtubePlayList,
  });

  factory BreakingNew.fromRawJson(String str) => BreakingNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreakingNew.fromJson(Map<String, dynamic> json) => BreakingNew(
    breakingNewsId: json["breaking_news_id"],
    breakingNews: json["Breaking_News"],
    youtubePlayList: json["Youtube_Play_List"],
  );

  Map<String, dynamic> toJson() => {
    "breaking_news_id": breakingNewsId,
    "Breaking_News": breakingNews,
    "Youtube_Play_List": youtubePlayList,
  };
}
