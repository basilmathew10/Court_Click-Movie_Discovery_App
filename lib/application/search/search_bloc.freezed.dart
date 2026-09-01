// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchEvent {
  String get apiKey => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apiKey, String query, int page)
    getSearchMovies,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiKey, String query, int page)? getSearchMovies,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiKey, String query, int page)? getSearchMovies,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSearchMovies value) getSearchMovies,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSearchMovies value)? getSearchMovies,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSearchMovies value)? getSearchMovies,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
    SearchEvent value,
    $Res Function(SearchEvent) then,
  ) = _$SearchEventCopyWithImpl<$Res, SearchEvent>;
  @useResult
  $Res call({String apiKey, String query, int page});
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? query = null,
    Object? page = null,
  }) {
    return _then(
      _value.copyWith(
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            query: null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GetSearchMoviesImplCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$GetSearchMoviesImplCopyWith(
    _$GetSearchMoviesImpl value,
    $Res Function(_$GetSearchMoviesImpl) then,
  ) = __$$GetSearchMoviesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String apiKey, String query, int page});
}

/// @nodoc
class __$$GetSearchMoviesImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$GetSearchMoviesImpl>
    implements _$$GetSearchMoviesImplCopyWith<$Res> {
  __$$GetSearchMoviesImplCopyWithImpl(
    _$GetSearchMoviesImpl _value,
    $Res Function(_$GetSearchMoviesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? query = null,
    Object? page = null,
  }) {
    return _then(
      _$GetSearchMoviesImpl(
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
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

class _$GetSearchMoviesImpl implements _GetSearchMovies {
  const _$GetSearchMoviesImpl({
    required this.apiKey,
    required this.query,
    required this.page,
  });

  @override
  final String apiKey;
  @override
  final String query;
  @override
  final int page;

  @override
  String toString() {
    return 'SearchEvent.getSearchMovies(apiKey: $apiKey, query: $query, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchMoviesImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiKey, query, page);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchMoviesImplCopyWith<_$GetSearchMoviesImpl> get copyWith =>
      __$$GetSearchMoviesImplCopyWithImpl<_$GetSearchMoviesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String apiKey, String query, int page)
    getSearchMovies,
  }) {
    return getSearchMovies(apiKey, query, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String apiKey, String query, int page)? getSearchMovies,
  }) {
    return getSearchMovies?.call(apiKey, query, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String apiKey, String query, int page)? getSearchMovies,
    required TResult orElse(),
  }) {
    if (getSearchMovies != null) {
      return getSearchMovies(apiKey, query, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSearchMovies value) getSearchMovies,
  }) {
    return getSearchMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSearchMovies value)? getSearchMovies,
  }) {
    return getSearchMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSearchMovies value)? getSearchMovies,
    required TResult orElse(),
  }) {
    if (getSearchMovies != null) {
      return getSearchMovies(this);
    }
    return orElse();
  }
}

abstract class _GetSearchMovies implements SearchEvent {
  const factory _GetSearchMovies({
    required final String apiKey,
    required final String query,
    required final int page,
  }) = _$GetSearchMoviesImpl;

  @override
  String get apiKey;
  @override
  String get query;
  @override
  int get page;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchMoviesImplCopyWith<_$GetSearchMoviesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  ApiStatus get getSearchMoviesStatus => throw _privateConstructorUsedError;
  SearchResponse? get getSearchMoviesResponse =>
      throw _privateConstructorUsedError;
  List<Result> get searchResultList => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String get currentQuery => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({
    ApiStatus getSearchMoviesStatus,
    SearchResponse? getSearchMoviesResponse,
    List<Result> searchResultList,
    int currentPage,
    int totalPages,
    bool isLoadingMore,
    String currentQuery,
    String errorMessage,
    String successMessage,
  });
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getSearchMoviesStatus = null,
    Object? getSearchMoviesResponse = freezed,
    Object? searchResultList = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? currentQuery = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(
      _value.copyWith(
            getSearchMoviesStatus: null == getSearchMoviesStatus
                ? _value.getSearchMoviesStatus
                : getSearchMoviesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            getSearchMoviesResponse: freezed == getSearchMoviesResponse
                ? _value.getSearchMoviesResponse
                : getSearchMoviesResponse // ignore: cast_nullable_to_non_nullable
                      as SearchResponse?,
            searchResultList: null == searchResultList
                ? _value.searchResultList
                : searchResultList // ignore: cast_nullable_to_non_nullable
                      as List<Result>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            currentQuery: null == currentQuery
                ? _value.currentQuery
                : currentQuery // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ApiStatus getSearchMoviesStatus,
    SearchResponse? getSearchMoviesResponse,
    List<Result> searchResultList,
    int currentPage,
    int totalPages,
    bool isLoadingMore,
    String currentQuery,
    String errorMessage,
    String successMessage,
  });
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getSearchMoviesStatus = null,
    Object? getSearchMoviesResponse = freezed,
    Object? searchResultList = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? currentQuery = null,
    Object? errorMessage = null,
    Object? successMessage = null,
  }) {
    return _then(
      _$SearchStateImpl(
        getSearchMoviesStatus: null == getSearchMoviesStatus
            ? _value.getSearchMoviesStatus
            : getSearchMoviesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        getSearchMoviesResponse: freezed == getSearchMoviesResponse
            ? _value.getSearchMoviesResponse
            : getSearchMoviesResponse // ignore: cast_nullable_to_non_nullable
                  as SearchResponse?,
        searchResultList: null == searchResultList
            ? _value._searchResultList
            : searchResultList // ignore: cast_nullable_to_non_nullable
                  as List<Result>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        currentQuery: null == currentQuery
            ? _value.currentQuery
            : currentQuery // ignore: cast_nullable_to_non_nullable
                  as String,
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

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl({
    required this.getSearchMoviesStatus,
    required this.getSearchMoviesResponse,
    required final List<Result> searchResultList,
    required this.currentPage,
    required this.totalPages,
    required this.isLoadingMore,
    required this.currentQuery,
    required this.errorMessage,
    required this.successMessage,
  }) : _searchResultList = searchResultList;

  @override
  final ApiStatus getSearchMoviesStatus;
  @override
  final SearchResponse? getSearchMoviesResponse;
  final List<Result> _searchResultList;
  @override
  List<Result> get searchResultList {
    if (_searchResultList is EqualUnmodifiableListView)
      return _searchResultList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResultList);
  }

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final bool isLoadingMore;
  @override
  final String currentQuery;
  @override
  final String errorMessage;
  @override
  final String successMessage;

  @override
  String toString() {
    return 'SearchState(getSearchMoviesStatus: $getSearchMoviesStatus, getSearchMoviesResponse: $getSearchMoviesResponse, searchResultList: $searchResultList, currentPage: $currentPage, totalPages: $totalPages, isLoadingMore: $isLoadingMore, currentQuery: $currentQuery, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.getSearchMoviesStatus, getSearchMoviesStatus) ||
                other.getSearchMoviesStatus == getSearchMoviesStatus) &&
            (identical(
                  other.getSearchMoviesResponse,
                  getSearchMoviesResponse,
                ) ||
                other.getSearchMoviesResponse == getSearchMoviesResponse) &&
            const DeepCollectionEquality().equals(
              other._searchResultList,
              _searchResultList,
            ) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.currentQuery, currentQuery) ||
                other.currentQuery == currentQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getSearchMoviesStatus,
    getSearchMoviesResponse,
    const DeepCollectionEquality().hash(_searchResultList),
    currentPage,
    totalPages,
    isLoadingMore,
    currentQuery,
    errorMessage,
    successMessage,
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState({
    required final ApiStatus getSearchMoviesStatus,
    required final SearchResponse? getSearchMoviesResponse,
    required final List<Result> searchResultList,
    required final int currentPage,
    required final int totalPages,
    required final bool isLoadingMore,
    required final String currentQuery,
    required final String errorMessage,
    required final String successMessage,
  }) = _$SearchStateImpl;

  @override
  ApiStatus get getSearchMoviesStatus;
  @override
  SearchResponse? get getSearchMoviesResponse;
  @override
  List<Result> get searchResultList;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  bool get isLoadingMore;
  @override
  String get currentQuery;
  @override
  String get errorMessage;
  @override
  String get successMessage;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
