import 'package:clickia/pages/anasayfa.dart';
import 'package:clickia/pages/login.dart';
import 'package:clickia/pages/register_page.dart';
import 'package:clickia/pages/watch_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff000000)).copyWith( textTheme:GoogleFonts.sourceSerifProTextTheme()),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(child: WatchDetailPage()),
      ),
    );
  }
}