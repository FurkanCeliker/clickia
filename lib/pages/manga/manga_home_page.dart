import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/novel/novel_home_page.dart';
import 'package:clickia/widgets/dizi_film_manga_kategori_widget.dart';
import 'package:clickia/widgets/novel_category_icerik.dart';
import 'package:clickia/widgets/novel_icerik_slider.dart';
import 'package:clickia/widgets/visibility_image_list.dart';
import 'package:clickia/widgets/visibility_video_widget.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:clickia/route/route.dart' as route;

class MangaHomePage extends StatefulWidget {
  MangaHomePage({Key? key}) : super(key: key);

  @override
  State<MangaHomePage> createState() => _MangaHomePageState();
}

class _MangaHomePageState extends State<MangaHomePage> {
  List categoryTitleList = [
    'Terror Infinite',
    'Release That Witch',
    'Martial World',
    'A Will Eternal',
    'Laçin'
  ];
  List<String> categoryImageList = [
    'https://img.webnovel.com/bookcover/21816086206078705/150/150.jpg?coverUpdateTime=1649215840812&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/21816086206078705/150/150.jpg?coverUpdateTime=1649215840812&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/21816086206078705/150/150.jpg?coverUpdateTime=1649215840812&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/21816086206078705/150/150.jpg?coverUpdateTime=1649215840812&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/21816086206078705/150/150.jpg?coverUpdateTime=1649215840812&imageMogr2/quality/80'
  ];
  List novelCategoryCoverImage = [
    'https://img.webnovel.com/bookcover/19852661006620705/150/150.jpg?coverUpdateTime=1625743044622&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/21276835306035905/150/150.jpg?coverUpdateTime=1632886577705&imageMogr2/quality/80',
    'https://img.webnovel.com/bookcover/17932851106749705/150/150.jpg?coverUpdateTime=1647248369872&imageMogr2/quality/80'
  ];
  List _sliderImageList = [
    'https://webbanner.webnovel.com/0_banner_1608779096_9391.jpg',
    'https://webbanner.webnovel.com/0_banner_1608779208_9090.jpg'
  ];

  PageController _controller = PageController();
  double fraction = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PageController _controller =
        PageController(initialPage: 2, viewportFraction: fraction);
  }

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);

    String titleOrnek = '1.Assassination Through the';
    String contentOrnek =
        'Cedric Reyes has a secret, he is the heir and eldest sonof the rich and powerful Reyes clan. As tradition all heirs of their family have to go through a form of poverty training at the age of fifteen. They are left to fend for themselves with no contact and barely any money.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                VisibilityVideoWidget(seconds: 5),
                VisiblilityImageWidget(
                  sliderImageList: _sliderImageList,
                  seconds: 5,
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DiziFilmMangaKategoriWidget(
                    onTap: () {},
                    yukseklik: _yukseklik,
                    genislik: _genislik,
                    simgePath: 'lib/assets/dizi.png',
                    categoryName: 'Dizi'),
                DiziFilmMangaKategoriWidget(
                  onTap: () {},
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  simgePath: 'lib/assets/film.png',
                  categoryName: 'Film',
                ),
                DiziFilmMangaKategoriWidget(
                  onTap: () {
                    Navigator.pushNamed(context, route.novelPage);
                  },
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  simgePath: 'lib/assets/novel.png',
                  categoryName: 'Novel',
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.05,
            ),
            NovelCategoryCoverAndContents(
                controller: _controller,
                yukseklik: _yukseklik,
                titleOrnek: titleOrnek,
                genislik: _genislik,
                contentOrnek: contentOrnek,
                categoryImageList: categoryImageList,
                categoryTitleList: categoryTitleList,
                categoryName: 'Macera'),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            NovelCategoryIcerik(
                onTap: () {
                  Navigator.pushNamed(context, route.novelDetailPage);
                },
                categoryImageList: categoryImageList,
                categoryTitleList: categoryTitleList),
            SizedBox(
              height: _yukseklik * 0.1,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _genislik * 0.05),
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/ranking.PNG'))),
                        height: _yukseklik * 0.15,
                        width: _genislik * 0.7,
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.only(
                              right: _genislik * 0.1,
                              bottom: _yukseklik * 0.01),
                          child: Text(
                            'Power Ranking ',
                            style: StyleConst.getRankingCategoryTitle(),
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: _yukseklik * 0.07,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, route.novelDetailPage);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: _yukseklik * 0.14,
                                width: _genislik * 0.21,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://img.webnovel.com/bookcover/12820870105509205/150/150.jpg?coverUpdateTime=1647020812513&imageMogr2/quality/80',
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: _yukseklik * 0.15,
                              ),
                              Text(
                                '01',
                                style: StyleConst.getRankingNumber(),
                              ),
                              SizedBox(
                                width: _genislik * 0.03,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Supreme Magus',
                                    style: StyleConst.getRankingTitleStyle(),
                                  ),
                                  Text(
                                    'Fantasy',
                                    style: StyleConst.getRankingSubtitleStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  GestureDetector categoryWidget3(double _yukseklik) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          height: _yukseklik * 0.30,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(novelCategoryCoverImage[2]))),
        ),
      ),
    );
  }

  GestureDetector categoryWidget2(double _yukseklik) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          height: _yukseklik * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(novelCategoryCoverImage[1]))),
        ),
      ),
    );
  }

  GestureDetector categoryWidget1(double _yukseklik) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          height: _yukseklik * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(novelCategoryCoverImage[0]))),
        ),
      ),
    );
  }
}
