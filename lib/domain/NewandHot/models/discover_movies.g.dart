// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverMovies _$DiscoverMoviesFromJson(Map<String, dynamic> json) =>
    DiscoverMovies(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => NewandHotData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$DiscoverMoviesToJson(DiscoverMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

NewandHotData _$NewandHotDataFromJson(Map<String, dynamic> json) =>
    NewandHotData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      releaseDate: json['release_date'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      originalTitle: json['originalTitle'] as String?,
    );

Map<String, dynamic> _$NewandHotDataToJson(NewandHotData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'originalTitle': instance.originalTitle,
      'release_date': instance.releaseDate,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
