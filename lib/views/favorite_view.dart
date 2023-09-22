import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/favorite_view_model.dart';
import '../widgets/my_list_tile.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<FavoriteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: false,
      ),
      body: StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          addAutomaticKeepAlives: true,
          itemCount: favoriteViewModel.favoriteList.length,
          itemBuilder: (context, index) {
            final url = favoriteViewModel.favoriteList[index].artworkUrl100 ??
                favoriteViewModel.favoriteList[index].artworkUrl60 ??
                favoriteViewModel.favoriteList[index].artworkUrl30;

            return MyListTile(
              isFavorite: favoriteViewModel.favoriteList
                  .contains(favoriteViewModel.favoriteList[index]),
              onFavorite: () {
                favoriteViewModel
                    .toggleFavorite(favoriteViewModel.favoriteList[index]);
              },
              url: url,
              result: favoriteViewModel.favoriteList[index],
            );
          },
        ),
      ),
    );
  }
}
