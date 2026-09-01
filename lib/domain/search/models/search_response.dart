class SearchResponse {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  SearchResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      page: json['page'],
      results: json['results'] != null
          ? List<Result>.from(
              json['results'].map((x) => Result.fromJson(x)))
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results?.map((x) => x.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  bool? softcore;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.softcore,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'])
          : null,
      id: json['id'],
      title: json['title'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'] != null
          ? (json['popularity'] as num).toDouble()
          : null,
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      softcore: json['softcore'],
      video: json['video'],
      voteAverage: json['vote_average'] != null
          ? (json['vote_average'] as num).toDouble()
          : null,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'softcore': softcore,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}