import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../widgets/app_scaffold.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.gallery,
      body: const Center(
        child: Text('This is the gallery page'),
      ),
    );
  }
}
