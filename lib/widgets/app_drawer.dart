import 'package:flutter/material.dart';

import '../constants/globals.dart';
import '../constants/page_titles.dart';
import '../constants/route_names.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Globals.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    Globals.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('user@email.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.android),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(PageTitles.home),
            onTap: () async {
              _closeDrawer(context);
              await Navigator.pushNamed(context, RouteNames.home);
            },
            selected: _selectedRoute == RouteNames.home,
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text(PageTitles.gallery),
            onTap: () async {
              _closeDrawer(context);
              await Navigator.pushNamed(context, RouteNames.gallery);
            },
            selected: _selectedRoute == RouteNames.gallery,
          ),
          ListTile(
            leading: const Icon(Icons.slideshow),
            title: const Text(PageTitles.slideshow),
            onTap: () async {
              _closeDrawer(context);
              await Navigator.pushNamed(context, RouteNames.slideshow);
            },
            selected: _selectedRoute == RouteNames.slideshow,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(PageTitles.settings),
            onTap: () async {
              _closeDrawer(context);
              await Navigator.pushNamed(context, RouteNames.settings);
            },
            selected: _selectedRoute == RouteNames.settings,
          ),
        ],
      ),
    );
  }

  /// Closes the drawer if applicable, which is only when it's not been displayed permanently.
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  void _closeDrawer(BuildContext context) {
    if (widget.permanentlyDisplay) {
      return;
    }
    Navigator.pop(context);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}
