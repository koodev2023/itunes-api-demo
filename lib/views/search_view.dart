import 'dart:async';

import 'package:easy_localization/easy_localization.dart';

import '../utils/utils.dart';
import '../view_models/favorite_view_model.dart';
import '../view_models/search_view_model.dart';
import '../widgets/my_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/my_list_tile.dart';
import '../widgets/my_search_bar.dart';

class SearchView extends StatefulWidget {
  static const String id = "search";
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);

    _searchController = TextEditingController(text: searchViewModel.searchText);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        searchViewModel.loadMore();
        Timer(
          const Duration(milliseconds: 1),
          () => _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context);
    final favoriteViewModel = Provider.of<FavoriteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('search_view_app_bar_title').tr(),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.setLocale(const Locale('en', 'US')),
                  icon: const Text('Eng'),
                ),
                IconButton(
                  onPressed: () => context.setLocale(const Locale.fromSubtags(
                      languageCode: 'zh', scriptCode: 'Hant')),
                  icon: const Text('繁'),
                ),
                IconButton(
                  onPressed: () => context.setLocale(const Locale.fromSubtags(
                      languageCode: 'zh', scriptCode: 'Hans')),
                  icon: const Text('简'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 3, 0),
            child: Row(
              children: [
                Expanded(
                  child: MySearchBar(
                    onSearch: (p0) async {
                      searchViewModel.updateSearchText(p0);
                      await searchViewModel.fetchSearchResult(context);
                    },
                    textEditingController: _searchController,
                    focusNode: _focusNode,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (_searchController.text.trim().length < 2) {
                      showSnackBar(context,
                          'Please enter at least two characters to search.');
                      return;
                    }

                    String searchText =
                        _searchController.text.replaceAll(RegExp(r'\s+'), ' ');

                    searchViewModel.updateSearchText(searchText);
                    await searchViewModel.fetchSearchResult(context);
                  },
                  icon: const Icon(Icons.search_outlined),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          MyChip(
                            label: 'search_view_model_type_label'.tr(),
                            keyString: searchViewModel.type,
                            dialogLabel:
                                'search_view_model_type_dialog_label'.tr(),
                            onConfirmed: (p0) {
                              searchViewModel.updateType(p0);
                              searchViewModel.fetchSearchResult(context);
                            },
                            dialogItemMap: searchViewModel.availableTypes,
                            onDeleted: () {
                              searchViewModel.resetType();
                              searchViewModel.fetchSearchResult(context);
                            },
                          ),
                          const SizedBox(width: 8),
                          MyChip(
                            label: 'search_view_model_country_label'.tr(),
                            keyString: searchViewModel.country,
                            dialogLabel:
                                'search_view_model_country_dialog_label'.tr(),
                            onConfirmed: (p0) {
                              searchViewModel.updateCountry(p0);
                              searchViewModel.fetchSearchResult(context);
                            },
                            dialogItemMap: searchViewModel.availableCountries,
                            onDeleted: () {
                              searchViewModel.resetCountry();
                              searchViewModel.fetchSearchResult(context);
                            },
                          ),
                          const SizedBox(width: 8),
                          MyChip(
                            label: 'search_view_model_media_label'.tr(),
                            keyString: searchViewModel.media,
                            dialogLabel:
                                'search_view_model_media_dialog_label'.tr(),
                            onConfirmed: (p0) {
                              searchViewModel.updateMedia(p0);
                              searchViewModel.fetchSearchResult(context);
                            },
                            dialogItemMap: searchViewModel.availableMedia,
                            onDeleted: () {
                              searchViewModel.resetMedia();
                              searchViewModel.fetchSearchResult(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: searchViewModel.isFetching
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(width: 10),
                      Text('${'search_view_loading'.tr()}...')
                    ],
                  )
                : searchViewModel.searchResultCount == 0 &&
                        searchViewModel.searchText.isNotEmpty
                    ? Center(child: Text('search_view_no_result'.tr()))
                    : StretchingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          controller: _scrollController,
                          addAutomaticKeepAlives: true,
                          itemCount: searchViewModel.visibleResultCount,
                          itemBuilder: (context, index) {
                            final url = searchViewModel
                                    .searchResults[index].artworkUrl100 ??
                                searchViewModel
                                    .searchResults[index].artworkUrl60 ??
                                searchViewModel
                                    .searchResults[index].artworkUrl30;

                            return MyListTile(
                              isFavorite: favoriteViewModel.favoriteList
                                  .contains(
                                      searchViewModel.searchResults[index]),
                              onFavorite: () {
                                favoriteViewModel.toggleFavorite(
                                    searchViewModel.searchResults[index]);
                              },
                              url: url,
                              result: searchViewModel.searchResults[index],
                            );
                          },
                        ),
                      ),
          ),
          searchViewModel.isLoadingMore
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(width: 10),
                      Text('${'search_view_loading'.tr()}...')
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
