import 'package:http/http.dart' as http;

import '../models/search_result.dart';

class SearchResultRepository {
  Future<SearchResult> getSearchResult(Map<String, String> queryParams) async {
    final httpsUri = Uri.https('itunes.apple.com', 'search', queryParams);

    final response = await http.get(httpsUri);

    if (response.statusCode == 200) {
      final searchResult = SearchResult.fromJson(response.body);

      return searchResult;
    } else {
      throw Exception('Failed to fetch search result');
    }
  }
}
