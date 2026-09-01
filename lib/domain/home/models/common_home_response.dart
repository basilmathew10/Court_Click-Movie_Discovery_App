class CommonHomeResponse {
  Dates? dates;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  CommonHomeResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory CommonHomeResponse.fromJson(Map<String, dynamic> json) {
    return CommonHomeResponse(
      dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,
      page: json['page'],
      results: json['results'] != null
          ? List<Result>.from(json['results'].map((x) => Result.fromJson(x)))
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toJson(),
      'page': page,
      'results': results?.map((x) => x.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(maximum: json['maximum'], minimum: json['minimum']);
  }

  Map<String, dynamic> toJson() {
    return {'maximum': maximum, 'minimum': minimum};
  }
}

class Result {
  bool? adult;
  String? backdropPath;
  int? id;

  // movie-only fields
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;

  // tv-only fields
  String? name;
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;

  // common fields
  String? overview;
  String? posterPath;
  String? mediaType;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  bool? softcore;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.softcore,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      releaseDate: json['release_date'],
      video: json['video'],
      name: json['name'],
      originalName: json['original_name'],
      firstAirDate: json['first_air_date'],
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'])
          : null,
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'])
          : null,
      popularity: json['popularity'] != null
          ? (json['popularity'] as num).toDouble()
          : null,
      softcore: json['softcore'],
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
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'release_date': releaseDate,
      'video': video,
      'name': name,
      'original_name': originalName,
      'first_air_date': firstAirDate,
      'origin_country': originCountry,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'softcore': softcore,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  bool get isMovie => mediaType == 'movie';
  bool get isTv => mediaType == 'tv';
}
