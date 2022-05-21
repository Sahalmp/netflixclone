import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixclone/domain/NewandHot/hotandnew_service.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';
import 'package:netflixclone/domain/NewandHot/models/discover_movies.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementaion implements HotAndNewService {
  @override
  Future<Either<MainFailure, DiscoverMovies>> getHotAndNewMovieData({
    String page='0'
  }) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandNewMovie,
         queryParameters: {
          'query': page,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = DiscoverMovies.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, DiscoverMovies>> getHotAndNewTVData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandNewTV,
       
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = DiscoverMovies.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
