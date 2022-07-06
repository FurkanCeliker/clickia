import 'package:clickia/pages/home/home_page.dart';
import 'package:clickia/pages/login/login.dart';
import 'package:clickia/pages/manga/manga_detail_page.dart';
import 'package:clickia/pages/manga/manga_home_page.dart';
import 'package:clickia/pages/novel/novel_detail_page.dart';
import 'package:clickia/pages/novel/novel_home_page.dart';
import 'package:clickia/pages/novel/novel_page.dart';
import 'package:clickia/pages/profile/body_widget.dart';
import 'package:clickia/pages/profile/my_account.dart';
import 'package:clickia/pages/profile/my_comments.dart';
import 'package:clickia/pages/profile/my_favorite.dart';
import 'package:clickia/pages/profile/notifications.dart';
import 'package:clickia/pages/profile/payments.dart';
import 'package:clickia/pages/profile/profile.dart';
import 'package:clickia/pages/profile/settings.dart';
import 'package:clickia/pages/register/register_page.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clickia/route/route.dart' as route;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff000000))
          .copyWith(textTheme: GoogleFonts.sourceSerifProTextTheme()),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     home: WatchDetailPage(),
      /*
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,*/
    );
  }
}
