import 'package:clone_ifood/views/content/content_page.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ifood clone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: ContentPage());
  }
}
