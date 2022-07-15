import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:clickia/route/route.dart' as route;


class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
  void onTapped(int index){
    setState(() {
      _selectedItem=index;
    });
    pageController.jumpToPage(index);
  }
  PageController pageController = PageController();
  final List<String> images = [
    'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png',
    'https://clickia.tv//storage/313/623e39294cc61_adsiz-tasarim-6jpg',
    'https://clickia.tv//storage/176/61e490edd9d53_Ads%C4%B1z-tasar%C4%B1m-(25).jpg',
    'https://clickia.tv//storage/257/61eb251113b46_Ads%C4%B1z-tasar%C4%B1m-(94).jpg'
  ];
  @override
  Widget build(BuildContext context) {
     double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return SingleChildScrollView(
        child: Column(
          children: [
            //1. Slider
            FutureBuilder(
              builder: (context, snapshot) {
                return GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>WatchDetailPage() ,));
                  }),
                  child: CarouselSlider(
                      carouselController: CarouselController(),
                      items: _sliderImageUrlList
                          .map(
                            (e) => SizedBox(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(e),
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      width: _genislik,
                                    ),
                                  ),
                                  SizedBox(
                                    height: _yukseklik * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                          aspectRatio: 1,
                          autoPlay: true,
                          viewportFraction: 1,
                          height: _yukseklik * 0.4,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 40))),
                );
              },
            ),
            SizedBox(
              height: _yukseklik * 0.012,
            ),
            //2. Slider
            FutureBuilder(
              builder: (context, snapshot) => GestureDetector(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WatchDetailPage(),));
                }),
                child: CarouselSlider(
                    items: images
                        .map((e) => ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image.network(
                                    e,
                                    fit: BoxFit.fill,
                                    width: _genislik * 0.8,
                                  )),
                                ],
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: _yukseklik * 0.7,
                      pageSnapping: true,
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      autoPlay: true,
                    )),
              ),
            ),

            MovieSlider(
              yukseklik: _yukseklik,
              genislik: _genislik,
              kategoriAdi: const ['Bayrama Özel', 'Barış', 'Aksiyon'],
              kategoriSayisi: 2,
              imageList: const [
                'https://clickia.tv//storage/349/6294d44e6fb61_274dd50f-b070-42b6-a221-adb94e3e5517jpeg',
                'https://clickia.tv//storage/112/61e17064b8565_Adsız-tasarım-(1).jpg',
                'https://clickia.tv//storage/241/61e87e1727025_Adsız-tasarım-(83).jpg',
                'https://clickia.tv//storage/347/628df35917c9b_adsiz-tasarim-20jpg'
              ],
            ),

            MovieSliderV2(
              kategoriSayisi: 1,
              yukseklik: _yukseklik,
              genislik: _genislik,
              imageList: const [
                'https://clickia.tv//storage/352/6294d6fd2cc08_f464a569-9b55-4a31-8734-0506b7ca1b13jpeg',
                'https://clickia.tv//storage/336/627c29a447d28_adsiz-tasarim-1jpg',
                'https://clickia.tv//storage/330/62517cd35cd60_adsiz-tasarim-16jpg',
                'https://clickia.tv//storage/193/61e5bb2003ea2_Adsız-tasarım-(41).jpg',
              ],
              onTap: () {},
            ),

            MovieSlider(
              yukseklik: _yukseklik,
              genislik: _genislik,
              kategoriAdi: const ['Bayrama Özel', 'Barış', 'Aksiyon'],
              kategoriSayisi: 2,
              imageList: const [
                'https://clickia.tv//storage/349/6294d44e6fb61_274dd50f-b070-42b6-a221-adb94e3e5517jpeg',
                'https://clickia.tv//storage/112/61e17064b8565_Adsız-tasarım-(1).jpg',
                'https://clickia.tv//storage/241/61e87e1727025_Adsız-tasarım-(83).jpg',
                'https://clickia.tv//storage/347/628df35917c9b_adsiz-tasarim-20jpg'
              ],
            ),

/*
            Text(
              'Popüler Başlıklar',
              style: StyleConst.getTextColorWhite().copyWith(
                fontSize: 30,
              ),
            ),

            SizedBox(
              height: _yukseklik * 0.06,
            ),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _kategoriBaslik.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(
                      left: _genislik * 0.1,
                      right: _genislik * 0.1,
                      top: _yukseklik * 0.01),
                  elevation: 5,
                  color: Color.fromARGB(136, 30, 29, 29),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Text('${index + 1}',
                          style: StyleConst.getKategoriSiraSayisiStyle()),
                      title: Text('${_kategoriBaslik[index]}',
                          style: StyleConst.getTextColorWhite()),
                      subtitle: Text(
                        _kategoriAltBaslik[index],
                        style: StyleConst.getTextColorWhite(),
                      ),
                    ),
                  ),
                );
              },
            ),
            */
          ],
        ),
      )
    ;
  }
}