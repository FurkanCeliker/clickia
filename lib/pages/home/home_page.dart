import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/constants/url.dart';
import 'package:clickia/pages/home/home_page_screen.dart';
import 'package:clickia/pages/manga/manga_home_page.dart';
import 'package:clickia/pages/novel/novel_detail_page.dart';
import 'package:clickia/pages/novel/novel_home_page.dart';
import 'package:clickia/pages/profile/profile.dart';
import 'package:clickia/pages/search/search.dart';
import 'package:clickia/pages/video/video_page.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:clickia/widgets/social_logo_widget.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clickia/route/route.dart' as route;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedItem = 0;
  final List<String> _kategoriBaslik = [
    'Ah Benim Tatlı Yalancım',
    'Herşey Aşktan',
    'Bin Yıllık Aşk',
    'Aşk Çıkmazı',
    'Mucize Şifacı',
    'Nerde Gönlüm'
  ];
  final List<String> _sliderImageUrlList = [
    'https://clickia.tv//storage/365/62c4473d8c0a5_clickia-dunyayi-sana-dondurmekjpg',
    'https://clickia.tv//storage/358/62c42098a14aa_clickia-royal-nirvanajpg'
  ];
  final List<String> _kategoriAltBaslik = [
    '1525',
    '1642',
    '2453',
    '3337',
    '4099',
    '5235'
  ];
  final List<String> images = [
    'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png',
    'https://clickia.tv//storage/313/623e39294cc61_adsiz-tasarim-6jpg',
    'https://clickia.tv//storage/176/61e490edd9d53_Ads%C4%B1z-tasar%C4%B1m-(25).jpg',
    'https://clickia.tv//storage/257/61eb251113b46_Ads%C4%B1z-tasar%C4%B1m-(94).jpg'
  ];
  final screens = [
    HomePageScreen(),
    VideoPage(),
    NovelHomePage(),
    MangaHomePage(),
    SearchWidget()
  ];
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        currentIndex: _selectedItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
             backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: _selectedItem == 0
                    ? const Color.fromARGB(255, 255, 136, 0)
                    : null,
              ),
              label: 'Anasayfa '),
          BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/dizi.png',
                height: _yukseklik * 0.03,
                color: _selectedItem == 1 ? null : Colors.grey,
              ),
              label: 'Video'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_sharp,
                color: _selectedItem == 2
                    ? const Color.fromARGB(255, 255, 136, 0)
                    : null,
              ),
              label: 'Novel'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/film.png',
                color: _selectedItem == 3 ? null : Colors.grey,
                height: _yukseklik * 0.03,
              ),
              label: 'Manga'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _selectedItem == 4 ? Colors.orange : null,
              ),
              label: 'Ara'),
        ],
        selectedItemColor: const Color.fromARGB(255, 220, 213, 213),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        showUnselectedLabels: true,
        iconSize: 22,
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedLabelStyle: const TextStyle(fontSize: 13), 
      ),
      extendBodyBehindAppBar: true,
      appBar: _selectedItem == 0 || _selectedItem==1 || _selectedItem==2
          ? AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: const Icon(Icons.account_box),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  },
                )
              ],
              leading: Padding(
                padding: EdgeInsets.only(left: _genislik * 0.02),
                child: Image.asset(
                  LogoPath.getClickiaLogo(),
                  width: _genislik * 0.1,
                  height: _yukseklik * 0.05,
                ),
              ),
            )
          : null,
      body: screens[_selectedItem],
    );
  }
}
