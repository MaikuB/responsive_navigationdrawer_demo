import 'package:flutter/material.dart';

import 'app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({@required this.body, @required this.pageTitle, Key key})
      : super(key: key);

  final Widget body;

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 600) {
      return Row(
        children: [
          const AppDrawer(
            permanentlyDisplay: true,
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                //
                automaticallyImplyLeading: false,
                title: Text(pageTitle),
              ),
              body: body,
            ),
          )
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      drawer: const AppDrawer(
        permanentlyDisplay: false,
      ),
      body: body,
    );
  }
}
