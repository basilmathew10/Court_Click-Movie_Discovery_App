// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  String get apiKey => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apiKey, int page) getTrendingMovies,
    required TResult Function(String apiKey, String type, int page)
    getMoviesListing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiKey, int page)? getTrendingMovies,
    TResult? Function(String apiKey, String type, int page)? getMoviesListing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiKey, int page)? getTrendingMovies,
    TResult Function(String apiKey, String type, int page)? getMoviesListing,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrendingMovies value) getTrendingMovies,
    required TResult Function(_GetMoviesListing value) getMoviesListing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult? Function(_GetMoviesListing value)? getMoviesListing,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult Function(_GetMoviesListing value)? getMoviesListing,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeEventCopyWith<HomeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
  @useResult
  $Res call({String apiKey, int page});
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiKey = null, Object? page = null}) {
    return _then(
      _value.copyWith(
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetTrendingMoviesImplCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$$GetTrendingMoviesImplCopyWith(
    _$GetTrendingMoviesImpl value,
    $Res Function(_$GetTrendingMoviesImpl) then,
  ) = __$$GetTrendingMoviesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiKey, int page});
}

/// @nodoc
class __$$GetTrendingMoviesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetTrendingMoviesImpl>
    implements _$$GetTrendingMoviesImplCopyWith<$Res> {
  __$$GetTrendingMoviesImplCopyWithImpl(
    _$GetTrendingMoviesImpl _value,
    $Res Function(_$GetTrendingMoviesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiKey = null, Object? page = null}) {
    return _then(
      _$GetTrendingMoviesImpl(
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetTrendingMoviesImpl implements _GetTrendingMovies {
  const _$GetTrendingMoviesImpl({required this.apiKey, required this.page});

  @override
  final String apiKey;
  @override
  final int page;

  @override
  String toString() {
    return 'HomeEvent.getTrendingMovies(apiKey: $apiKey, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTrendingMoviesImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiKey, page);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTrendingMoviesImplCopyWith<_$GetTrendingMoviesImpl> get copyWith =>
      __$$GetTrendingMoviesImplCopyWithImpl<_$GetTrendingMoviesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apiKey, int page) getTrendingMovies,
    required TResult Function(String apiKey, String type, int page)
    getMoviesListing,
  }) {
    return getTrendingMovies(apiKey, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiKey, int page)? getTrendingMovies,
    TResult? Function(String apiKey, String type, int page)? getMoviesListing,
  }) {
    return getTrendingMovies?.call(apiKey, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiKey, int page)? getTrendingMovies,
    TResult Function(String apiKey, String type, int page)? getMoviesListing,
    required TResult orElse(),
  }) {
    if (getTrendingMovies != null) {
      return getTrendingMovies(apiKey, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrendingMovies value) getTrendingMovies,
    required TResult Function(_GetMoviesListing value) getMoviesListing,
  }) {
    return getTrendingMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult? Function(_GetMoviesListing value)? getMoviesListing,
  }) {
    return getTrendingMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult Function(_GetMoviesListing value)? getMoviesListing,
    required TResult orElse(),
  }) {
    if (getTrendingMovies != null) {
      return getTrendingMovies(this);
    }
    return orElse();
  }
}

abstract class _GetTrendingMovies implements HomeEvent {
  const factory _GetTrendingMovies({
    required final String apiKey,
    required final int page,
  }) = _$GetTrendingMoviesImpl;

  @override
  String get apiKey;
  @override
  int get page;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTrendingMoviesImplCopyWith<_$GetTrendingMoviesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMoviesListingImplCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$$GetMoviesListingImplCopyWith(
    _$GetMoviesListingImpl value,
    $Res Function(_$GetMoviesListingImpl) then,
  ) = __$$GetMoviesListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiKey, String type, int page});
}

/// @nodoc
class __$$GetMoviesListingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetMoviesListingImpl>
    implements _$$GetMoviesListingImplCopyWith<$Res> {
  __$$GetMoviesListingImplCopyWithImpl(
    _$GetMoviesListingImpl _value,
    $Res Function(_$GetMoviesListingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiKey = null, Object? type = null, Object? page = null}) {
    return _then(
      _$GetMoviesListingImpl(
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetMoviesListingImpl implements _GetMoviesListing {
  const _$GetMoviesListingImpl({
    required this.apiKey,
    required this.type,
    required this.page,
  });

  @override
  final String apiKey;
  @override
  final String type;
  @override
  final int page;

  @override
  String toString() {
    return 'HomeEvent.getMoviesListing(apiKey: $apiKey, type: $type, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoviesListingImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiKey, type, page);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoviesListingImplCopyWith<_$GetMoviesListingImpl> get copyWith =>
      __$$GetMoviesListingImplCopyWithImpl<_$GetMoviesListingImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apiKey, int page) getTrendingMovies,
    required TResult Function(String apiKey, String type, int page)
    getMoviesListing,
  }) {
    return getMoviesListing(apiKey, type, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiKey, int page)? getTrendingMovies,
    TResult? Function(String apiKey, String type, int page)? getMoviesListing,
  }) {
    return getMoviesListing?.call(apiKey, type, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiKey, int page)? getTrendingMovies,
    TResult Function(String apiKey, String type, int page)? getMoviesListing,
    required TResult orElse(),
  }) {
    if (getMoviesListing != null) {
      return getMoviesListing(apiKey, type, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrendingMovies value) getTrendingMovies,
    required TResult Function(_GetMoviesListing value) getMoviesListing,
  }) {
    return getMoviesListing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult? Function(_GetMoviesListing value)? getMoviesListing,
  }) {
    return getMoviesListing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrendingMovies value)? getTrendingMovies,
    TResult Function(_GetMoviesListing value)? getMoviesListing,
    required TResult orElse(),
  }) {
    if (getMoviesListing != null) {
      return getMoviesListing(this);
    }
    return orElse();
  }
}

abstract class _GetMoviesListing implements HomeEvent {
  const factory _GetMoviesListing({
    required final String apiKey,
    required final String type,
    required final int page,
  }) = _$GetMoviesListingImpl;

  @override
  String get apiKey;
  String get type;
  @override
  int get page;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMoviesListingImplCopyWith<_$GetMoviesListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  ApiStatus get getTrendingMoviesStatus => throw _privateConstructorUsedError;
  CommonHomeResponse? get getTrendingMoviesResponse =>
      throw _privateConstructorUsedError;
  ApiStatus get getMoviesListingStatus => throw _privateConstructorUsedError;
  CommonHomeResponse? get getMoviesListingResponse =>
      throw _privateConstructorUsedError;
  ApiStatus get popularMoviesStatus => throw _privateConstructorUsedError;
  CommonHomeResponse? get popularMoviesResponse =>
      throw _privateConstructorUsedError;
  ApiStatus get topRatedMoviesStatus => throw _privateConstructorUsedError;
  CommonHomeResponse? get topRatedMoviesResponse =>
      throw _privateConstructorUsedError;
  ApiStatus get upcomingMoviesStatus => throw _privateConstructorUsedError;
  CommonHomeResponse? get upcomingMoviesResponse =>
      throw _privateConstructorUsedError;
  List<Result> get upcomingMoviesList => throw _privateConstructorUsedError;
  int get upcomingCurrentPage => throw _privateConstructorUsedError;
  int get upcomingTotalPages => throw _privateConstructorUsedError;
  bool get isLoadingMoreUpcoming => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    ApiStatus getTrendingMoviesStatus,
    CommonHomeResponse? getTrendingMoviesResponse,
    ApiStatus getMoviesListingStatus,
    CommonHomeResponse? getMoviesListingResponse,
    ApiStatus popularMoviesStatus,
    CommonHomeResponse? popularMoviesResponse,
    ApiStatus topRatedMoviesStatus,
    CommonHomeResponse? topRatedMoviesResponse,
    ApiStatus upcomingMoviesStatus,
    CommonHomeResponse? upcomingMoviesResponse,
    List<Result> upcomingMoviesList,
    int upcomingCurrentPage,
    int upcomingTotalPages,
    bool isLoadingMoreUpcoming,
    String errorMessage,
    String successMessage,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTrendingMoviesStatus = null,
    Object? getTrendingMoviesResponse = freezed,
    Object? getMoviesListingStatus = null,
    Object? getMoviesListingResponse = freezed,
    Object? popularMoviesStatus = null,
    Object? popularMoviesResponse = freezed,
    Object? topRatedMoviesStatus = null,
    Object? topRatedMoviesResponse = freezed,
    Object? upcomingMoviesStatus = null,
    Object? upcomingMoviesResponse = freezed,
    Object? upcomingMoviesList = null,
    Object? upcomingCurrentPage = null,
    Object? upcomingTotalPages = null,
    Object? isLoadingMoreUpcoming = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(
      _value.copyWith(
            getTrendingMoviesStatus: null == getTrendingMoviesStatus
                ? _value.getTrendingMoviesStatus
                : getTrendingMoviesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            getTrendingMoviesResponse: freezed == getTrendingMoviesResponse
                ? _value.getTrendingMoviesResponse
                : getTrendingMoviesResponse // ignore: cast_nullable_to_non_nullable
                      as CommonHomeResponse?,
            getMoviesListingStatus: null == getMoviesListingStatus
                ? _value.getMoviesListingStatus
                : getMoviesListingStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            getMoviesListingResponse: freezed == getMoviesListingResponse
                ? _value.getMoviesListingResponse
                : getMoviesListingResponse // ignore: cast_nullable_to_non_nullable
                      as CommonHomeResponse?,
            popularMoviesStatus: null == popularMoviesStatus
                ? _value.popularMoviesStatus
                : popularMoviesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            popularMoviesResponse: freezed == popularMoviesResponse
                ? _value.popularMoviesResponse
                : popularMoviesResponse // ignore: cast_nullable_to_non_nullable
                      as CommonHomeResponse?,
            topRatedMoviesStatus: null == topRatedMoviesStatus
                ? _value.topRatedMoviesStatus
                : topRatedMoviesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            topRatedMoviesResponse: freezed == topRatedMoviesResponse
                ? _value.topRatedMoviesResponse
                : topRatedMoviesResponse // ignore: cast_nullable_to_non_nullable
                      as CommonHomeResponse?,
            upcomingMoviesStatus: null == upcomingMoviesStatus
                ? _value.upcomingMoviesStatus
                : upcomingMoviesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            upcomingMoviesResponse: freezed == upcomingMoviesResponse
                ? _value.upcomingMoviesResponse
                : upcomingMoviesResponse // ignore: cast_nullable_to_non_nullable
                      as CommonHomeResponse?,
            upcomingMoviesList: null == upcomingMoviesList
                ? _value.upcomingMoviesList
                : upcomingMoviesList // ignore: cast_nullable_to_non_nullable
                      as List<Result>,
            upcomingCurrentPage: null == upcomingCurrentPage
                ? _value.upcomingCurrentPage
                : upcomingCurrentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            upcomingTotalPages: null == upcomingTotalPages
                ? _value.upcomingTotalPages
                : upcomingTotalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMoreUpcoming: null == isLoadingMoreUpcoming
                ? _value.isLoadingMoreUpcoming
                : isLoadingMoreUpcoming // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            successMessage: null == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ApiStatus getTrendingMoviesStatus,
    CommonHomeResponse? getTrendingMoviesResponse,
    ApiStatus getMoviesListingStatus,
    CommonHomeResponse? getMoviesListingResponse,
    ApiStatus popularMoviesStatus,
    CommonHomeResponse? popularMoviesResponse,
    ApiStatus topRatedMoviesStatus,
    CommonHomeResponse? topRatedMoviesResponse,
    ApiStatus upcomingMoviesStatus,
    CommonHomeResponse? upcomingMoviesResponse,
    List<Result> upcomingMoviesList,
    int upcomingCurrentPage,
    int upcomingTotalPages,
    bool isLoadingMoreUpcoming,
    String errorMessage,
    String successMessage,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getTrendingMoviesStatus = null,
    Object? getTrendingMoviesResponse = freezed,
    Object? getMoviesListingStatus = null,
    Object? getMoviesListingResponse = freezed,
    Object? popularMoviesStatus = null,
    Object? popularMoviesResponse = freezed,
    Object? topRatedMoviesStatus = null,
    Object? topRatedMoviesResponse = freezed,
    Object? upcomingMoviesStatus = null,
    Object? upcomingMoviesResponse = freezed,
    Object? upcomingMoviesList = null,
    Object? upcomingCurrentPage = null,
    Object? upcomingTotalPages = null,
    Object? isLoadingMoreUpcoming = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(
      _$HomeStateImpl(
        getTrendingMoviesStatus: null == getTrendingMoviesStatus
            ? _value.getTrendingMoviesStatus
            : getTrendingMoviesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        getTrendingMoviesResponse: freezed == getTrendingMoviesResponse
            ? _value.getTrendingMoviesResponse
            : getTrendingMoviesResponse // ignore: cast_nullable_to_non_nullable
                  as CommonHomeResponse?,
        getMoviesListingStatus: null == getMoviesListingStatus
            ? _value.getMoviesListingStatus
            : getMoviesListingStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        getMoviesListingResponse: freezed == getMoviesListingResponse
            ? _value.getMoviesListingResponse
            : getMoviesListingResponse // ignore: cast_nullable_to_non_nullable
                  as CommonHomeResponse?,
        popularMoviesStatus: null == popularMoviesStatus
            ? _value.popularMoviesStatus
            : popularMoviesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        popularMoviesResponse: freezed == popularMoviesResponse
            ? _value.popularMoviesResponse
            : popularMoviesResponse // ignore: cast_nullable_to_non_nullable
                  as CommonHomeResponse?,
        topRatedMoviesStatus: null == topRatedMoviesStatus
            ? _value.topRatedMoviesStatus
            : topRatedMoviesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        topRatedMoviesResponse: freezed == topRatedMoviesResponse
            ? _value.topRatedMoviesResponse
            : topRatedMoviesResponse // ignore: cast_nullable_to_non_nullable
                  as CommonHomeResponse?,
        upcomingMoviesStatus: null == upcomingMoviesStatus
            ? _value.upcomingMoviesStatus
            : upcomingMoviesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        upcomingMoviesResponse: freezed == upcomingMoviesResponse
            ? _value.upcomingMoviesResponse
            : upcomingMoviesResponse // ignore: cast_nullable_to_non_nullable
                  as CommonHomeResponse?,
        upcomingMoviesList: null == upcomingMoviesList
            ? _value._upcomingMoviesList
            : upcomingMoviesList // ignore: cast_nullable_to_non_nullable
                  as List<Result>,
        upcomingCurrentPage: null == upcomingCurrentPage
            ? _value.upcomingCurrentPage
            : upcomingCurrentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        upcomingTotalPages: null == upcomingTotalPages
            ? _value.upcomingTotalPages
            : upcomingTotalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMoreUpcoming: null == isLoadingMoreUpcoming
            ? _value.isLoadingMoreUpcoming
            : isLoadingMoreUpcoming // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        successMessage: null == successMessage
            ? _value.successMessage
            : successMessage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    required this.getTrendingMoviesStatus,
    required this.getTrendingMoviesResponse,
    required this.getMoviesListingStatus,
    required this.getMoviesListingResponse,
    required this.popularMoviesStatus,
    required this.popularMoviesResponse,
    required this.topRatedMoviesStatus,
    required this.topRatedMoviesResponse,
    required this.upcomingMoviesStatus,
    required this.upcomingMoviesResponse,
    required final List<Result> upcomingMoviesList,
    required this.upcomingCurrentPage,
    required this.upcomingTotalPages,
    required this.isLoadingMoreUpcoming,
    required this.errorMessage,
    required this.successMessage,
  }) : _upcomingMoviesList = upcomingMoviesList;

  @override
  final ApiStatus getTrendingMoviesStatus;
  @override
  final CommonHomeResponse? getTrendingMoviesResponse;
  @override
  final ApiStatus getMoviesListingStatus;
  @override
  final CommonHomeResponse? getMoviesListingResponse;
  @override
  final ApiStatus popularMoviesStatus;
  @override
  final CommonHomeResponse? popularMoviesResponse;
  @override
  final ApiStatus topRatedMoviesStatus;
  @override
  final CommonHomeResponse? topRatedMoviesResponse;
  @override
  final ApiStatus upcomingMoviesStatus;
  @override
  final CommonHomeResponse? upcomingMoviesResponse;
  final List<Result> _upcomingMoviesList;
  @override
  List<Result> get upcomingMoviesList {
    if (_upcomingMoviesList is EqualUnmodifiableListView)
      return _upcomingMoviesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingMoviesList);
  }

  @override
  final int upcomingCurrentPage;
  @override
  final int upcomingTotalPages;
  @override
  final bool isLoadingMoreUpcoming;
  @override
  final String errorMessage;
  @override
  final String successMessage;

  @override
  String toString() {
    return 'HomeState(getTrendingMoviesStatus: $getTrendingMoviesStatus, getTrendingMoviesResponse: $getTrendingMoviesResponse, getMoviesListingStatus: $getMoviesListingStatus, getMoviesListingResponse: $getMoviesListingResponse, popularMoviesStatus: $popularMoviesStatus, popularMoviesResponse: $popularMoviesResponse, topRatedMoviesStatus: $topRatedMoviesStatus, topRatedMoviesResponse: $topRatedMoviesResponse, upcomingMoviesStatus: $upcomingMoviesStatus, upcomingMoviesResponse: $upcomingMoviesResponse, upcomingMoviesList: $upcomingMoviesList, upcomingCurrentPage: $upcomingCurrentPage, upcomingTotalPages: $upcomingTotalPages, isLoadingMoreUpcoming: $isLoadingMoreUpcoming, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(
                  other.getTrendingMoviesStatus,
                  getTrendingMoviesStatus,
                ) ||
                other.getTrendingMoviesStatus == getTrendingMoviesStatus) &&
            (identical(
                  other.getTrendingMoviesResponse,
                  getTrendingMoviesResponse,
                ) ||
                other.getTrendingMoviesResponse == getTrendingMoviesResponse) &&
            (identical(other.getMoviesListingStatus, getMoviesListingStatus) ||
                other.getMoviesListingStatus == getMoviesListingStatus) &&
            (identical(
                  other.getMoviesListingResponse,
                  getMoviesListingResponse,
                ) ||
                other.getMoviesListingResponse == getMoviesListingResponse) &&
            (identical(other.popularMoviesStatus, popularMoviesStatus) ||
                other.popularMoviesStatus == popularMoviesStatus) &&
            (identical(other.popularMoviesResponse, popularMoviesResponse) ||
                other.popularMoviesResponse == popularMoviesResponse) &&
            (identical(other.topRatedMoviesStatus, topRatedMoviesStatus) ||
                other.topRatedMoviesStatus == topRatedMoviesStatus) &&
            (identical(other.topRatedMoviesResponse, topRatedMoviesResponse) ||
                other.topRatedMoviesResponse == topRatedMoviesResponse) &&
            (identical(other.upcomingMoviesStatus, upcomingMoviesStatus) ||
                other.upcomingMoviesStatus == upcomingMoviesStatus) &&
            (identical(other.upcomingMoviesResponse, upcomingMoviesResponse) ||
                other.upcomingMoviesResponse == upcomingMoviesResponse) &&
            const DeepCollectionEquality().equals(
              other._upcomingMoviesList,
              _upcomingMoviesList,
            ) &&
            (identical(other.upcomingCurrentPage, upcomingCurrentPage) ||
                other.upcomingCurrentPage == upcomingCurrentPage) &&
            (identical(other.upcomingTotalPages, upcomingTotalPages) ||
                other.upcomingTotalPages == upcomingTotalPages) &&
            (identical(other.isLoadingMoreUpcoming, isLoadingMoreUpcoming) ||
                other.isLoadingMoreUpcoming == isLoadingMoreUpcoming) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getTrendingMoviesStatus,
    getTrendingMoviesResponse,
    getMoviesListingStatus,
    getMoviesListingResponse,
    popularMoviesStatus,
    popularMoviesResponse,
    topRatedMoviesStatus,
    topRatedMoviesResponse,
    upcomingMoviesStatus,
    upcomingMoviesResponse,
    const DeepCollectionEquality().hash(_upcomingMoviesList),
    upcomingCurrentPage,
    upcomingTotalPages,
    isLoadingMoreUpcoming,
    errorMessage,
    successMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    required final ApiStatus getTrendingMoviesStatus,
    required final CommonHomeResponse? getTrendingMoviesResponse,
    required final ApiStatus getMoviesListingStatus,
    required final CommonHomeResponse? getMoviesListingResponse,
    required final ApiStatus popularMoviesStatus,
    required final CommonHomeResponse? popularMoviesResponse,
    required final ApiStatus topRatedMoviesStatus,
    required final CommonHomeResponse? topRatedMoviesResponse,
    required final ApiStatus upcomingMoviesStatus,
    required final CommonHomeResponse? upcomingMoviesResponse,
    required final List<Result> upcomingMoviesList,
    required final int upcomingCurrentPage,
    required final int upcomingTotalPages,
    required final bool isLoadingMoreUpcoming,
    required final String errorMessage,
    required final String successMessage,
  }) = _$HomeStateImpl;

  @override
  ApiStatus get getTrendingMoviesStatus;
  @override
  CommonHomeResponse? get getTrendingMoviesResponse;
  @override
  ApiStatus get getMoviesListingStatus;
  @override
  CommonHomeResponse? get getMoviesListingResponse;
  @override
  ApiStatus get popularMoviesStatus;
  @override
  CommonHomeResponse? get popularMoviesResponse;
  @override
  ApiStatus get topRatedMoviesStatus;
  @override
  CommonHomeResponse? get topRatedMoviesResponse;
  @override
  ApiStatus get upcomingMoviesStatus;
  @override
  CommonHomeResponse? get upcomingMoviesResponse;
  @override
  List<Result> get upcomingMoviesList;
  @override
  int get upcomingCurrentPage;
  @override
  int get upcomingTotalPages;
  @override
  bool get isLoadingMoreUpcoming;
  @override
  String get errorMessage;
  @override
  String get successMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
