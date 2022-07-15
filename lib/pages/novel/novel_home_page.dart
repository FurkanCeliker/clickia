import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/novel/novel_detail_page.dart';
import 'package:clickia/pages/novel/novel_page.dart';
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

class _NovelHomePageState extends State<NovelHomePage>
    with SingleTickerProviderStateMixin {
  List categoryTitleList = [
    'Terror Infinite',
    'Release That Witch',
    'Martial World',
    'A Will Eternal',
    'Laçin'
  ];

  List<Map<dynamic, dynamic>> rankingMap = [
    {
      'id': '0',
      'name': 'Terror Infinity',
      'category': 'Fantasy',
      'img':
          'https://ctv.emresarioglu.com.tr//storage/376/62baf56320e96_adsiz-tasarim-31jpg'
    },
    {
      'id': '1',
      'name': 'Release That Witch',
      'category': 'Action',
      'img':
          'https://ctv.emresarioglu.com.tr//storage/364/62b9b8f966f05_adsiz-tasarim-20jpg'
    },
    {
      'id': '2',
      'name': 'Martial World',
      'category': 'Comedy',
      'img':
          'https://ctv.emresarioglu.com.tr//storage/370/62b9c548bc4ee_adsiz-tasarim-26jpg'
    },
    {
      'id': '3',
      'name': 'Rebirth Of The Theif',
      'category': 'Comedy',
      'img':
          'https://ctv.emresarioglu.com.tr//storage/368/62b9c11f0688d_adsiz-tasarim-24jpg'
    },
    {
      'id': '4',
      'name': 'Rebirth Of The Theif',
      'category': 'Comedy',
      'img':
          'https://ctv.emresarioglu.com.tr//storage/368/62b9c11f0688d_adsiz-tasarim-24jpg'
    }
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
  List novelContentImageList = [
    'https://ctv.emresarioglu.com.tr//storage/370/62b9c548bc4ee_adsiz-tasarim-26jpg',
    'https://ctv.emresarioglu.com.tr//storage/364/62b9b8f966f05_adsiz-tasarim-20jpg',
    'https://ctv.emresarioglu.com.tr//storage/376/62baf56320e96_adsiz-tasarim-31jpg',
    'https://ctv.emresarioglu.com.tr//storage/338/6297517d03f0b_hoodjpg',
    'https://ctv.emresarioglu.com.tr//storage/380/62baf70208190_adsiz-tasarim-35jpg'
  ];
  List _sliderImageList = [
    'https://webbanner.webnovel.com/0_banner_1608779096_9391.jpg',
    'https://webbanner.webnovel.com/0_banner_1608779208_9090.jpg'
  ];

  List sliderLastImg = [
    'https://ctv.emresarioglu.com.tr//storage/370/62b9c548bc4ee_adsiz-tasarim-26jpg',
    'https://ctv.emresarioglu.com.tr//storage/364/62b9b8f966f05_adsiz-tasarim-20jpg',
    'https://ctv.emresarioglu.com.tr//storage/376/62baf56320e96_adsiz-tasarim-31jpg'
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
     Offset img2offset= Offset(-15, 0);
    double sliderOneX = 15;
    double sliderOneY = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _yukseklik * 0.02,
            ),
            BenzerIceriklerSlider(
                imageList: novelContentImageList,
                yukseklik: _yukseklik,
                genislik: _genislik,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NovelPage(),
                      ));
                }),
            SizedBox(
              height: _yukseklik * 0.02,
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
                  height: _yukseklik*0.02
                ),
                BenzerIceriklerSlider(
                imageList: novelContentImageList,
                yukseklik: _yukseklik,
                genislik: _genislik,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NovelPage(),
                      ));
                }),
            SizedBox(
              height: _yukseklik * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _genislik * 0.03),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(179, 236, 229, 229)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _genislik * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rankings',
                        style: TextStyle(color: Colors.orange, fontSize: 25),
                      ),
                      SizedBox(
                        width: _genislik,
                        height: _yukseklik * 0.65,
                        child: GridView.builder(
                            // Ranking sayısı kadar gridview oluşturulacak
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 2 / 1.3),
                            itemBuilder: (index, i) {
                              return ListView.builder(
                                // İlgili rankingin içerikleri listelenecek.
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: rankingMap.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => NovelPage(),));
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: _genislik * 0.10,
                                              height: _yukseklik * 0.09,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          rankingMap[index]
                                                              ['img']),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              width: _genislik * 0.02,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: _yukseklik * 0.06),
                                              child: Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    color: index % 2 == 0
                                                        ? Colors.red
                                                        : Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: _genislik * 0.02,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    rankingMap[index]['name'],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          _yukseklik * 0.02),
                                                  child: Text(
                                                    rankingMap[index]
                                                        ['category'],
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: _yukseklik * 0.01,
                                      )
                                    ],
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.1,
            ),
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
    required List<String> categoryImageList,
    required double yukseklik,
    required this.titleOrnek,
    required double genislik,
    required String categoryName,
    required this.contentOrnek,
    required List categoryTitleList,
  })  : _controller = controller,
        _yukseklik = yukseklik,
        _genislik = genislik,
        _categoryImageList = categoryImageList,
        _categoryName = categoryName,
        _categoryTitleList = categoryTitleList,
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
        SizedBox(
          height: _yukseklik * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(left: _genislik * 0.05),
          child: Text(
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
                        Image.network(
                          'https://img.webnovel.com/bookcover/17932851106749705/150/150.jpg?coverUpdateTime=1647248369872&imageMogr2/quality/80',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: _yukseklik * 0.01,
                        ),
                        Expanded(
                          child: Text(titleOrnek,
                              style: StyleConst.getNovelPageCategoryTitle()),
                        ),
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
            
          ]),
        ),
      ],
    );
  }
}
