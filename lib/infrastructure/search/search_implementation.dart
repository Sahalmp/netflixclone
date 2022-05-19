import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/search/models/search_response/search_response.dart';

import 'package:netflixclone/domain/core/failures/main_failures.dart';

import 'package:dartz/dartz.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/search/searchservice.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
