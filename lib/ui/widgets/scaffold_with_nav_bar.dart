import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_utils.dart';
import '../utils/util.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: kMainButtons
            .map<BottomNavigationBarItem>(
                (e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
            .toList(),
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == APP_PAGE.groupPlayer.toPath) {
      return 0;
    }
    if (location == APP_PAGE.singlePlayer.toPath) {
      return 1;
    }
    if (location == APP_PAGE.settings.toPath) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(APP_PAGE.groupPlayer.toPath);
        break;
      case 1:
        GoRouter.of(context).go(APP_PAGE.singlePlayer.toPath);
        break;
      case 2:
        GoRouter.of(context).go(APP_PAGE.settings.toPath);
        break;
    }
  }
}
