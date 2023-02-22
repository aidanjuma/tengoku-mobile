import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tengoku/src/ui/views/search_view.dart';
import 'package:tengoku/src/ui/views/discover_view.dart';
import 'package:tengoku/src/providers/consumet_provider.dart';
import 'package:tengoku/src/utils/android_navigation_mode.dart';
import 'package:tengoku/src/ui/components/navigation/navigation_bar.dart'
    as nav;

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;
  DeviceNavigationMode navigationMode = DeviceNavigationMode.none;

  static const List<Widget> _pages = [DiscoverView(), SearchView(), Scaffold()];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Three-button navigation...
        if (navigationMode == DeviceNavigationMode.threeButton) {
          return SafeArea(child: _rootViewPage());
        }

        // NOT three-button navigation...
        return _rootViewPage();
      },
    );
  }

  Scaffold _rootViewPage() {
    return Scaffold(
      bottomNavigationBar: nav.NavigationBar(
        height: 100,
        iconSize: 28,
        items: <nav.NavigationBarItem>[
          nav.NavigationBarItem(icon: EvaIcons.bulbOutline),
          nav.NavigationBarItem(icon: EvaIcons.searchOutline),
          nav.NavigationBarItem(icon: EvaIcons.listOutline),
        ],
        onChanged: (int index) async {
          if (_currentIndex == 1) {
            await Provider.of<ConsumetProvider>(context, listen: false)
                .resetSearch();
          }
          _currentIndex = index;
          setState(() => {});
        },
      ),
      body: _pages[_currentIndex],
    );
  }

  Future<void> _initPlatformState() async {
    // ignore: no_leading_underscores_for_local_identifiers
    DeviceNavigationMode _navigationMode;

    try {
      _navigationMode = await AndroidNavigationMode.getNavigationMode;
    } catch (_) {
      _navigationMode = DeviceNavigationMode.none;
    }

    if (!mounted) return;

    setState(() {
      navigationMode = _navigationMode;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
