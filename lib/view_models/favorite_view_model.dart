import '../models/result.dart';
import '../repositories/favorite_repository.dart';

import 'package:flutter/material.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<Result> _favoriteList = [];
  List<Result> get favoriteList => _favoriteList;

  final FavoriteRepository _favoriteRepository = FavoriteRepository();

  FavoriteViewModel() {
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    _favoriteList = await _favoriteRepository.getFavorites();
    notifyListeners();
  }

  Future<void> addToFavorites(Result result) async {
    await _favoriteRepository.addFavorite(result);
    fetchFavorites();
  }

  Future<void> removeFromFavorites(Result result) async {
    await _favoriteRepository.removeFavorite(result);
    fetchFavorites();
  }

  void toggleFavorite(Result result) async {
    if (favoriteList.contains(result)) {
      await removeFromFavorites(result);
    } else {
      await addToFavorites(result);
    }
  }
}
