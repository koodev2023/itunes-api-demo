import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'result.dart';

class SearchResult {
  int resultCount;
  List<Result> results;
  SearchResult({
    required this.resultCount,
    required this.results,
  });

  SearchResult copyWith({
    int? resultCount,
    List<Result>? results,
  }) {
    return SearchResult(
      resultCount: resultCount ?? this.resultCount,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resultCount': resultCount,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      resultCount: map['resultCount'] as int,
      results: List<Result>.from(
        (map['results'] as List<dynamic>).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) =>
      SearchResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchResult(resultCount: $resultCount, results: $results)';

  @override
  bool operator ==(covariant SearchResult other) {
    if (identical(this, other)) return true;

    return other.resultCount == resultCount &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => resultCount.hashCode ^ results.hashCode;
}
