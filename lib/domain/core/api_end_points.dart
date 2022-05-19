import 'package:netflixclone/core/strings.dart';
import 'package:netflixclone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$apibaseurl/trending/all/day?api_key=$apikey#";
  static const search = '$apibaseurl/search/movie?api_key=$apikey';
}
