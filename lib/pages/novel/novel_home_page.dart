import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
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

class NovelHomePage extends StatefulWidget {
  NovelHomePage({Key? key}) : super(key: key);

  @override
  State<NovelHomePage> createState() => _NovelHomePageState();
}

class _NovelHomePageState extends State<NovelHomePage> {

  List categoryTitleList=['Terror Infinite','Release That Witch','Martial World','A Will Eternal','Laçin'];
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
                categoryName: 'Aksiyon',
                categoryTitleList: categoryTitleList,
                categoryImageList: categoryImageList,
                controller: _controller,
                yukseklik: _yukseklik,
                titleOrnek: titleOrnek,
                genislik: _genislik,
                contentOrnek: contentOrnek),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            
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

class NovelCategoryCoverAndContents extends StatelessWidget {
  const NovelCategoryCoverAndContents({
    Key? key,
    required PageController controller,
    required List<String>categoryImageList,
    required double yukseklik,
    required this.titleOrnek,
    required double genislik,
    required String categoryName,
    required this.contentOrnek,
    required List categoryTitleList,
  })  : _controller = controller,
        _yukseklik = yukseklik,
        _genislik = genislik,
        _categoryImageList=categoryImageList,
        _categoryName=categoryName,
        _categoryTitleList=categoryTitleList,
        super(key: key);

  final PageController _controller;
  final double _yukseklik;
  final String titleOrnek;
  final double _genislik;
  final String contentOrnek;
  final List<String> _categoryImageList;
  final String _categoryName;
  final List _categoryTitleList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: _genislik * 0.05),
          child:  Text(
            _categoryName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Container(
          color: const Color(0xffF6F7FC),
          child: Column(children: [
            AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                
                controller: _controller,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: _yukseklik * 0.03,
                        ),
                        Image.network(
                          'https://img.webnovel.com/bookcover/17932851106749705/150/150.jpg?coverUpdateTime=1647248369872&imageMogr2/quality/80',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: _yukseklik * 0.01,
                        ),
                        Text(titleOrnek,
                            style: StyleConst.getNovelPageCategoryTitle()),
                        SizedBox(
                          height: _yukseklik * 0.04,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _genislik * 0.05, right: _genislik * 0.05),
                          child: Text(
                            contentOrnek,
                          ),
                        ),
                        SizedBox(
                          height: _yukseklik * 0.05,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            NovelCategoryIcerik(onTap: () {
              Navigator.pushNamed(context, route.novelDetailPage);
            },categoryImageList: _categoryImageList,categoryTitleList: _categoryTitleList,),
          ]),
        ),
     
      ],
    );
  }
}
