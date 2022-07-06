import 'package:clickia/pages/home/home_page.dart';
import 'package:clickia/pages/login/login.dart';
import 'package:clickia/pages/novel/novel_detail_page.dart';
import 'package:clickia/pages/novel/novel_home_page.dart';
import 'package:clickia/pages/novel/novel_page.dart';
import 'package:clickia/pages/profile/my_account.dart';
import 'package:clickia/pages/profile/profile.dart';
import 'package:clickia/pages/register/register_page.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:flutter/material.dart';


const String loginPage='loginPage';
const String registerPage='registerPage';
const String homePage='homePage';
const String profilePage='profilePage';
const String watchDetailPage='watchDetailPage';
const String novelPage='novelPage';
const String novelHomePage='novelHomePage';
const String novelDetailPage='novelDetailPage';
const String myAccountPage='myAccountPage';

Route<dynamic> controller(RouteSettings settings){
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => RegisterPage(),);
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage(),);
    case watchDetailPage:
      return MaterialPageRoute(builder: (context) => WatchDetailPage(),);
    case novelPage:
      return MaterialPageRoute(builder: (context) => NovelPage(),);
    case novelHomePage:
      return MaterialPageRoute(builder: (context) => NovelHomePage(),);
    case novelDetailPage: 
      return MaterialPageRoute(builder: (context) => NovelDetailPage(),);
    case myAccountPage:
      return MaterialPageRoute(builder: (context) =>MyAccount() ,);
    case profilePage:
      return MaterialPageRoute(builder: ((context) =>ProfileScreen() ));
      
    default:
    throw('Rota bulunamadı!');
  }
}
