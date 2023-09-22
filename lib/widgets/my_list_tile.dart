import 'package:apple_api_demo/utils/string_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/result.dart';

class MyListTile extends StatelessWidget {
  final String? url;
  final Result result;
  final bool isFavorite;
  final void Function() onFavorite;
  const MyListTile({
    super.key,
    this.url,
    required this.isFavorite,
    required this.onFavorite,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = result.wrapperType != null
        ? result.wrapperType! == 'artist'
            ? getTranslatedValue(result.wrapperType!)
            : '${getTranslatedValue(result.wrapperType!)} • ${result.artistName!}'
        : result.artistName == null
            ? getTranslatedValue(result.kind!)
            : '${getTranslatedValue(result.kind!)} • ${result.artistName!}';

    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      leading: AspectRatio(
        aspectRatio: 1,
        child: result.trackId == null && result.collectionId == null
            ? const FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.person,
                ),
              )
            : url == null
                ? const FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: url!,
                    fit: BoxFit.cover,
                  ),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              result.trackName ?? result.collectionName ?? result.artistName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Flexible(
            child: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () => onFavorite(),
        icon: isFavorite
            ? Icon(Icons.favorite, color: Theme.of(context).primaryColor)
            : const Icon(Icons.favorite_outline),
      ),
    );
  }
}
