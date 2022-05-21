import 'package:json_annotation/json_annotation.dart';

part 'discover_movies.g.dart';

@JsonSerializable()
class DiscoverMovies {
  int? page;
  List<NewandHotData>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  DiscoverMovies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory DiscoverMovies.fromJson(Map<String, dynamic> json) {
    return _$DiscoverMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiscoverMoviesToJson(this);
}

@JsonSerializable()
class NewandHotData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  int? id;
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_name')
  String? originalName;
  String? overview;
  String? originalTitle;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  NewandHotData(
      {this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalName,
      this.releaseDate,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount,
      this.originalTitle});

  factory NewandHotData.fromJson(Map<String, dynamic> json) {
    return _$NewandHotDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewandHotDataToJson(this);
}
