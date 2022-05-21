import 'package:dartz/dartz.dart';
import 'package:netflixclone/domain/NewandHot/models/discover_movies.dart';
import 'package:netflixclone/domain/core/failures/main_failures.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, DiscoverMovies>> getHotAndNewMovieData({
     String page='0',
    
  });
    Future<Either<MainFailure, DiscoverMovies>> getHotAndNewTVData();

}
