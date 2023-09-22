import 'package:easy_localization/easy_localization.dart';

import '../models/result.dart';
import '../models/search_result.dart';
import 'package:flutter/material.dart';

import '../repositories/search_result_repository.dart';

class SearchViewModel extends ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;

  void updateSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  final SearchResultRepository _searchResultRepository =
      SearchResultRepository();

  SearchResult _searchResult = SearchResult(resultCount: 0, results: []);
  int get searchResultCount => _searchResult.resultCount;
  List<Result> get searchResults => _searchResult.results;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  void showFetching() {
    _isFetching = true;
    notifyListeners();
  }

  void hideFetching() {
    _isFetching = false;
    notifyListeners();
  }

  Future<void> fetchSearchResult(BuildContext context) async {
    if (_searchText.isEmpty) {
      return;
    }

    showFetching();

    Map<String, String> queryParams = {
      'term': _searchText,
      'limit': '200',
      if (_type.isNotEmpty) 'entity': _type,
      if (_country.isNotEmpty) 'country': _country,
      if (_media.isNotEmpty) 'media': _media,
    };

    Stopwatch stopwatch = Stopwatch()..start();
    _searchResult = await _searchResultRepository.getSearchResult(queryParams);
    stopwatch.stop();
    if (stopwatch.elapsedMilliseconds < 350) {
      await Future.delayed(
          Duration(milliseconds: 350 - stopwatch.elapsedMilliseconds));
    }

    _visibleResult = searchResultCount <= 20 ? searchResultCount : 20;
    hideFetching();
    notifyListeners();
  }

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;
  int _visibleResult = 0;

  int get visibleResultCount => _visibleResult;

  void showLoadingMore() {
    _isLoadingMore = true;
    notifyListeners();
  }

  void hideLoadingMore() {
    _isLoadingMore = false;
    notifyListeners();
  }

  void loadMore() async {
    if (_visibleResult < searchResultCount) {
      showLoadingMore();
      await Future.delayed(const Duration(milliseconds: 500));

      searchResultCount - _visibleResult >= 20
          ? _visibleResult += 20
          : _visibleResult = searchResultCount;

      hideLoadingMore();
      notifyListeners();
    }
  }

  Map<String, String> get availableTypes {
    return {
      'song': 'search_view_model_type_song'.tr(),
      'album': 'search_view_model_type_album'.tr(),
      'allArtist': 'search_view_model_type_artist'.tr(),
    };
  }

  String _type = '';
  String get type => _type;

  void updateType(String type) {
    _type = type;
    notifyListeners();
  }

  void resetType() {
    _type = '';
    notifyListeners();
  }

  Map<String, String> get availableCountries {
    return {
      'AD': "search_view_model_country_code_AD".tr(),
      'AE': "search_view_model_country_code_AE".tr(),
      'AF': "search_view_model_country_code_AF".tr(),
      'AG': "search_view_model_country_code_AG".tr(),
      'AI': "search_view_model_country_code_AI".tr(),
      'AL': "search_view_model_country_code_AL".tr(),
      'AM': "search_view_model_country_code_AM".tr(),
      'AO': "search_view_model_country_code_AO".tr(),
      'AQ': "search_view_model_country_code_AQ".tr(),
      'AR': "search_view_model_country_code_AR".tr(),
      'AS': "search_view_model_country_code_AS".tr(),
      'AT': "search_view_model_country_code_AT".tr(),
      'AU': "search_view_model_country_code_AU".tr(),
      'AW': "search_view_model_country_code_AW".tr(),
      'AX': "search_view_model_country_code_AX".tr(),
      'AZ': "search_view_model_country_code_AZ".tr(),
      'BA': "search_view_model_country_code_BA".tr(),
      'BB': "search_view_model_country_code_BB".tr(),
      'BD': "search_view_model_country_code_BD".tr(),
      'BE': "search_view_model_country_code_BE".tr(),
      'BF': "search_view_model_country_code_BF".tr(),
      'BG': "search_view_model_country_code_BG".tr(),
      'BH': "search_view_model_country_code_BH".tr(),
      'BI': "search_view_model_country_code_BI".tr(),
      'BJ': "search_view_model_country_code_BJ".tr(),
      'BL': "search_view_model_country_code_BL".tr(),
      'BM': "search_view_model_country_code_BM".tr(),
      'BN': "search_view_model_country_code_BN".tr(),
      'BO': "search_view_model_country_code_BO".tr(),
      'BQ': "search_view_model_country_code_BQ".tr(),
      'BR': "search_view_model_country_code_BR".tr(),
      'BS': "search_view_model_country_code_BS".tr(),
      'BT': "search_view_model_country_code_BT".tr(),
      'BV': "search_view_model_country_code_BV".tr(),
      'BW': "search_view_model_country_code_BW".tr(),
      'BY': "search_view_model_country_code_BY".tr(),
      'BZ': "search_view_model_country_code_BZ".tr(),
      'CA': "search_view_model_country_code_CA".tr(),
      'CC': "search_view_model_country_code_CC".tr(),
      'CD': "search_view_model_country_code_CD".tr(),
      'CF': "search_view_model_country_code_CF".tr(),
      'CG': "search_view_model_country_code_CG".tr(),
      'CH': "search_view_model_country_code_CH".tr(),
      'CI': "search_view_model_country_code_CI".tr(),
      'CK': "search_view_model_country_code_CK".tr(),
      'CL': "search_view_model_country_code_CL".tr(),
      'CM': "search_view_model_country_code_CM".tr(),
      'CN': "search_view_model_country_code_CN".tr(),
      'CO': "search_view_model_country_code_CO".tr(),
      'CR': "search_view_model_country_code_CR".tr(),
      'CU': "search_view_model_country_code_CU".tr(),
      'CV': "search_view_model_country_code_CV".tr(),
      'CW': "search_view_model_country_code_CW".tr(),
      'CX': "search_view_model_country_code_CX".tr(),
      'CY': "search_view_model_country_code_CY".tr(),
      'CZ': "search_view_model_country_code_CZ".tr(),
      'DE': "search_view_model_country_code_DE".tr(),
      'DJ': "search_view_model_country_code_DJ".tr(),
      'DK': "search_view_model_country_code_DK".tr(),
      'DM': "search_view_model_country_code_DM".tr(),
      'DO': "search_view_model_country_code_DO".tr(),
      'DZ': "search_view_model_country_code_DZ".tr(),
      'EC': "search_view_model_country_code_EC".tr(),
      'EE': "search_view_model_country_code_EE".tr(),
      'EG': "search_view_model_country_code_EG".tr(),
      'EH': "search_view_model_country_code_EH".tr(),
      'ER': "search_view_model_country_code_ER".tr(),
      'ES': "search_view_model_country_code_ES".tr(),
      'ET': "search_view_model_country_code_ET".tr(),
      'FI': "search_view_model_country_code_FI".tr(),
      'FJ': "search_view_model_country_code_FJ".tr(),
      'FK': "search_view_model_country_code_FK".tr(),
      'FM': "search_view_model_country_code_FM".tr(),
      'FO': "search_view_model_country_code_FO".tr(),
      'FR': "search_view_model_country_code_FR".tr(),
      'GA': "search_view_model_country_code_GA".tr(),
      'GB': "search_view_model_country_code_GB".tr(),
      'GD': "search_view_model_country_code_GD".tr(),
      'GE': "search_view_model_country_code_GE".tr(),
      'GF': "search_view_model_country_code_GF".tr(),
      'GG': "search_view_model_country_code_GG".tr(),
      'GH': "search_view_model_country_code_GH".tr(),
      'GI': "search_view_model_country_code_GI".tr(),
      'GL': "search_view_model_country_code_GL".tr(),
      'GM': "search_view_model_country_code_GM".tr(),
      'GN': "search_view_model_country_code_GN".tr(),
      'GP': "search_view_model_country_code_GP".tr(),
      'GQ': "search_view_model_country_code_GQ".tr(),
      'GR': "search_view_model_country_code_GR".tr(),
      'GS': "search_view_model_country_code_GS".tr(),
      'GT': "search_view_model_country_code_GT".tr(),
      'GU': "search_view_model_country_code_GU".tr(),
      'GW': "search_view_model_country_code_GW".tr(),
      'GY': "search_view_model_country_code_GY".tr(),
      'HK': "search_view_model_country_code_HK".tr(),
      'HM': "search_view_model_country_code_HM".tr(),
      'HN': "search_view_model_country_code_HN".tr(),
      'HR': "search_view_model_country_code_HR".tr(),
      'HT': "search_view_model_country_code_HT".tr(),
      'HU': "search_view_model_country_code_HU".tr(),
      'ID': "search_view_model_country_code_ID".tr(),
      'IE': "search_view_model_country_code_IE".tr(),
      'IL': "search_view_model_country_code_IL".tr(),
      'IM': "search_view_model_country_code_IM".tr(),
      'IN': "search_view_model_country_code_IN".tr(),
      'IO': "search_view_model_country_code_IO".tr(),
      'IQ': "search_view_model_country_code_IQ".tr(),
      'IR': "search_view_model_country_code_IR".tr(),
      'IS': "search_view_model_country_code_IS".tr(),
      'IT': "search_view_model_country_code_IT".tr(),
      'JE': "search_view_model_country_code_JE".tr(),
      'JM': "search_view_model_country_code_JM".tr(),
      'JO': "search_view_model_country_code_JO".tr(),
      'JP': "search_view_model_country_code_JP".tr(),
      'KE': "search_view_model_country_code_KE".tr(),
      'KG': "search_view_model_country_code_KG".tr(),
      'KH': "search_view_model_country_code_KH".tr(),
      'KI': "search_view_model_country_code_KI".tr(),
      'KM': "search_view_model_country_code_KM".tr(),
      'KN': "search_view_model_country_code_KN".tr(),
      'KP': "search_view_model_country_code_KP".tr(),
      'KR': "search_view_model_country_code_KR".tr(),
      'KW': "search_view_model_country_code_KW".tr(),
      'KY': "search_view_model_country_code_KY".tr(),
      'KZ': "search_view_model_country_code_KZ".tr(),
      'LA': "search_view_model_country_code_LA".tr(),
      'LB': "search_view_model_country_code_LB".tr(),
      'LC': "search_view_model_country_code_LC".tr(),
      'LI': "search_view_model_country_code_LI".tr(),
      'LK': "search_view_model_country_code_LK".tr(),
      'LR': "search_view_model_country_code_LR".tr(),
      'LS': "search_view_model_country_code_LS".tr(),
      'LT': "search_view_model_country_code_LT".tr(),
      'LU': "search_view_model_country_code_LU".tr(),
      'LV': "search_view_model_country_code_LV".tr(),
      'LY': "search_view_model_country_code_LY".tr(),
      'MA': "search_view_model_country_code_MA".tr(),
      'MC': "search_view_model_country_code_MC".tr(),
      'MD': "search_view_model_country_code_MD".tr(),
      'ME': "search_view_model_country_code_ME".tr(),
      'MF': "search_view_model_country_code_MF".tr(),
      'MG': "search_view_model_country_code_MG".tr(),
      'MH': "search_view_model_country_code_MH".tr(),
      'MK': "search_view_model_country_code_MK".tr(),
      'ML': "search_view_model_country_code_ML".tr(),
      'MM': "search_view_model_country_code_MM".tr(),
      'MN': "search_view_model_country_code_MN".tr(),
      'MO': "search_view_model_country_code_MO".tr(),
      'MP': "search_view_model_country_code_MP".tr(),
      'MQ': "search_view_model_country_code_MQ".tr(),
      'MR': "search_view_model_country_code_MR".tr(),
      'MS': "search_view_model_country_code_MS".tr(),
      'MT': "search_view_model_country_code_MT".tr(),
      'MU': "search_view_model_country_code_MU".tr(),
      'MV': "search_view_model_country_code_MV".tr(),
      'MW': "search_view_model_country_code_MW".tr(),
      'MX': "search_view_model_country_code_MX".tr(),
      'MY': "search_view_model_country_code_MY".tr(),
      'MZ': "search_view_model_country_code_MZ".tr(),
      'NA': "search_view_model_country_code_NA".tr(),
      'NC': "search_view_model_country_code_NC".tr(),
      'NE': "search_view_model_country_code_NE".tr(),
      'NF': "search_view_model_country_code_NF".tr(),
      'NG': "search_view_model_country_code_NG".tr(),
      'NI': "search_view_model_country_code_NI".tr(),
      'NL': "search_view_model_country_code_NL".tr(),
      'NO': "search_view_model_country_code_NO".tr(),
      'NP': "search_view_model_country_code_NP".tr(),
      'NR': "search_view_model_country_code_NR".tr(),
      'NU': "search_view_model_country_code_NU".tr(),
      'NZ': "search_view_model_country_code_NZ".tr(),
      'OM': "search_view_model_country_code_OM".tr(),
      'PA': "search_view_model_country_code_PA".tr(),
      'PE': "search_view_model_country_code_PE".tr(),
      'PF': "search_view_model_country_code_PF".tr(),
      'PG': "search_view_model_country_code_PG".tr(),
      'PH': "search_view_model_country_code_PH".tr(),
      'PK': "search_view_model_country_code_PK".tr(),
      'PL': "search_view_model_country_code_PL".tr(),
      'PM': "search_view_model_country_code_PM".tr(),
      'PN': "search_view_model_country_code_PN".tr(),
      'PR': "search_view_model_country_code_PR".tr(),
      'PS': "search_view_model_country_code_PS".tr(),
      'PT': "search_view_model_country_code_PT".tr(),
      'PW': "search_view_model_country_code_PW".tr(),
      'PY': "search_view_model_country_code_PY".tr(),
      'QA': "search_view_model_country_code_QA".tr(),
      'RE': "search_view_model_country_code_RE".tr(),
      'RO': "search_view_model_country_code_RO".tr(),
      'RS': "search_view_model_country_code_RS".tr(),
      'RU': "search_view_model_country_code_RU".tr(),
      'RW': "search_view_model_country_code_RW".tr(),
      'SA': "search_view_model_country_code_SA".tr(),
      'SB': "search_view_model_country_code_SB".tr(),
      'SC': "search_view_model_country_code_SC".tr(),
      'SD': "search_view_model_country_code_SD".tr(),
      'SE': "search_view_model_country_code_SE".tr(),
      'SG': "search_view_model_country_code_SG".tr(),
      'SH': "search_view_model_country_code_SH".tr(),
      'SI': "search_view_model_country_code_SI".tr(),
      'SJ': "search_view_model_country_code_SJ".tr(),
      'SK': "search_view_model_country_code_SK".tr(),
      'SL': "search_view_model_country_code_SL".tr(),
      'SM': "search_view_model_country_code_SM".tr(),
      'SN': "search_view_model_country_code_SN".tr(),
      'SO': "search_view_model_country_code_SO".tr(),
      'SR': "search_view_model_country_code_SR".tr(),
      'SS': "search_view_model_country_code_SS".tr(),
      'ST': "search_view_model_country_code_ST".tr(),
      'SV': "search_view_model_country_code_SV".tr(),
      'SX': "search_view_model_country_code_SX".tr(),
      'SY': "search_view_model_country_code_SY".tr(),
      'SZ': "search_view_model_country_code_SZ".tr(),
      'TC': "search_view_model_country_code_TC".tr(),
      'TD': "search_view_model_country_code_TD".tr(),
      'TF': "search_view_model_country_code_TF".tr(),
      'TG': "search_view_model_country_code_TG".tr(),
      'TH': "search_view_model_country_code_TH".tr(),
      'TJ': "search_view_model_country_code_TJ".tr(),
      'TK': "search_view_model_country_code_TK".tr(),
      'TL': "search_view_model_country_code_TL".tr(),
      'TM': "search_view_model_country_code_TM".tr(),
      'TN': "search_view_model_country_code_TN".tr(),
      'TO': "search_view_model_country_code_TO".tr(),
      'TR': "search_view_model_country_code_TR".tr(),
      'TT': "search_view_model_country_code_TT".tr(),
      'TV': "search_view_model_country_code_TV".tr(),
      'TW': "search_view_model_country_code_TW".tr(),
      'TZ': "search_view_model_country_code_TZ".tr(),
      'UA': "search_view_model_country_code_UA".tr(),
      'UG': "search_view_model_country_code_UG".tr(),
      'UM': "search_view_model_country_code_UM".tr(),
      'US': "search_view_model_country_code_US".tr(),
      'UY': "search_view_model_country_code_UY".tr(),
      'UZ': "search_view_model_country_code_UZ".tr(),
      'VA': "search_view_model_country_code_VA".tr(),
      'VC': "search_view_model_country_code_VC".tr(),
      'VE': "search_view_model_country_code_VE".tr(),
      'VG': "search_view_model_country_code_VG".tr(),
      'VI': "search_view_model_country_code_VI".tr(),
      'VN': "search_view_model_country_code_VN".tr(),
      'VU': "search_view_model_country_code_VU".tr(),
      'WF': "search_view_model_country_code_WF".tr(),
      'WS': "search_view_model_country_code_WS".tr(),
      'YE': "search_view_model_country_code_YE".tr(),
      'YT': "search_view_model_country_code_YT".tr(),
      'ZA': "search_view_model_country_code_ZA".tr(),
      'ZM': "search_view_model_country_code_ZM".tr(),
      'ZW': "search_view_model_country_code_ZW".tr(),
    };
  }

  String _country = '';
  String get country => _country;

  void updateCountry(String country) async {
    _country = country;
    notifyListeners();
  }

  void resetCountry() {
    _country = '';
    notifyListeners();
  }

  Map<String, String> get availableMedia {
    return {
      'movie': "search_view_model_media_movie".tr(),
      'podcast': "search_view_model_media_podcast".tr(),
      'music': "search_view_model_media_music".tr(),
      'musicVideo': "search_view_model_media_musicVideo".tr(),
      'audiobook': "search_view_model_media_audiobook".tr(),
      'shortFilm': "search_view_model_media_shortFilm".tr(),
      'tvShow': "search_view_model_media_tvShow".tr(),
      'software': "search_view_model_media_software".tr(),
      'ebook': "search_view_model_media_ebook".tr(),
    };
  }

  String _media = '';
  String get media => _media;

  void updateMedia(String media) {
    _media = media;
    notifyListeners();
  }

  void resetMedia() {
    _media = '';
    notifyListeners();
  }
}
