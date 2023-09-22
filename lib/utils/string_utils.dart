import 'package:easy_localization/easy_localization.dart';

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }

  return input[0].toUpperCase() + input.substring(1);
}

String getTranslatedValue(String variable) {
  switch (variable) {
    case 'track':
      return "search_view_tile_track".tr();
    case 'collection':
      return "search_view_tile_collection".tr();
    case 'artist':
      return "search_view_tile_artist".tr();

    case 'movie':
      return "search_view_model_media_movie".tr();
    case 'podcast':
      return "search_view_model_media_podcast".tr();
    case 'music':
      return "search_view_model_media_music".tr();
    case 'musicVideo':
      return "search_view_model_media_musicVideo".tr();
    case 'audiobook':
      return "search_view_model_media_audiobook".tr();
    case 'shortFilm':
      return "search_view_model_media_shortFilm".tr();
    case 'tvShow':
      return "search_view_model_media_tvShow".tr();
    case 'software':
      return "search_view_model_media_software".tr();
    case 'ebook':
      return "search_view_model_media_ebook".tr();
    default:
      return '';
  }
}
