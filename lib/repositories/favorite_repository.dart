import 'package:hive/hive.dart';

import '../models/result.dart';

class FavoriteRepository {
  final String _boxName = 'resultBox';

  Future<void> addFavorite(Result result) async {
    final box = Hive.box(_boxName);
    await box.put(
        result.trackId ?? result.collectionId ?? result.artistId, result);
  }

  Future<void> removeFavorite(Result result) async {
    final box = Hive.box(_boxName);
    await box.delete(result.trackId ?? result.collectionId ?? result.artistId);
  }

  Future<List<Result>> getFavorites() async {
    final box = Hive.box(_boxName);
    final results = box.values.toList().cast<Result>();

    return results;
  }
}
