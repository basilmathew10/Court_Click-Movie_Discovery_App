import 'package:court_click_movie_dicovery_app/domain/core/di/env.dart';

class Urls {
  static String baseURL = Env.instance.domainUrl;
  static String apiVersionUrl = '$baseURL/3/';

  // static var apiUrl = '${Env.instance.domainUrl}/api/';

  static const String tokenRefresh = 'token-refresh';

  static const String trending = 'trending/all/week';
  static const String moviesListing = 'movie';
  static const String search = 'search/movie';
}
