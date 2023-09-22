import 'package:easy_localization/easy_localization.dart';

import 'favorite_view.dart';
import 'search_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const SearchView(),
    const FavoriteView(),
  ];

  String getSearchLabel() {
    return 'home_view_search_hint'.tr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: Localizations.override(
        context: context,
        locale: context.locale,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined),
              activeIcon: const Icon(Icons.search),
              label: getSearchLabel(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline),
              activeIcon: const Icon(Icons.favorite),
              label: 'home_view_favorite_hint'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
