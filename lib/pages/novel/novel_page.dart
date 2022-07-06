import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:clickia/widgets/comments_area_widget.dart';
import 'package:clickia/widgets/novel_chapters_widget.dart';
import 'package:clickia/widgets/novel_detail_button_widget.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clickia/route/route.dart' as route;

class NovelPage extends StatefulWidget {
  NovelPage({Key? key}) : super(key: key);

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  List chapters = [
    'Beklenmeyen Ölüm',
    'Laçin Güçlerini Keşfediyor',
    'Mektup',
    'Kayra’ nın İhaneti',
    'Lanetli Orman',
    'Tanrıça Zarlık',
    'Ayrılık',
    'Kayra’ nın Gerçek Kimliği',
    "Eski Savaş ve Yeni Dedektif",
    "Kaira'nın Gerçek Formu"
  ];
  String NovelPageImage =
      'https://img.webnovel.com/bookcover/18549008105094005/600/600.jpg?coverUpdateTime=1636927397380&imageMogr2/quality/40';
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: _yukseklik * 0.05,
                  right: _genislik * 0.08,
                  left: _genislik * 0.08),
              child: Container(
                height: _yukseklik * 0.7,
                width: _genislik,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(10, 5))
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                          NovelPageImage,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: _genislik * 0.07),
              child: Text(
                'Laçin',
                style: StyleConst.getNovelPageTitleStyle(),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: _genislik * 0.065,
                ),
                Icon(Icons.bookmark),
                SizedBox(
                  width: _genislik * 0.03,
                ),
                Text('Tarihi'),
                SizedBox(
                  width: _genislik * 0.03,
                ),
                Icon(Icons.file_open),
                SizedBox(
                  width: _genislik * 0.03,
                ),
                Text('10 Bölüm'),
                SizedBox(
                  width: _genislik * 0.02,
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: _genislik * 0.072),
              child:const Text(
                'Yazar:',
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NovelPageElevatedButtonWidget(
                    buttonColor: Color(0xff2850E0),
                    buttonContent: Text('Okumaya Başla!'),
                    onTapButton: () {
                      Navigator.pushNamed(context, route.novelDetailPage);
                    }),
                NovelPageElevatedButtonWidget(
                  buttonContent: Row(
                    children:const [
                      Icon(
                        Icons.add,
                        color: Color(0xff2850E0),
                      ),
                      Text(
                        'Kitaplığa Ekle!',
                        style: TextStyle(color: Color(0xff2147D8)),
                      )
                    ],
                  ),
                  buttonColor: Color(0xffF5F6FC),
                  onTapButton: () {},
                ),
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: _yukseklik,
                width: _genislik,
                child: ContainedTabBarView(
                  tabs:const [
                    Text(
                      'Hakkında',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Bölümler',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                  views: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: _genislik * 0.05, top: _yukseklik * 0.04),
                          child: Text(
                            'Seri Özeti',
                            style: StyleConst.getNovelPageTitleStyle(),
                          ),
                        ),
                        SizedBox(
                          height: _yukseklik * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _genislik * 0.05, right: _genislik * 0.05),
                          child: const Text(
                              'Laçin babasının intikamını alma yolunda kendini adamış bir kız çocuğu ve tanrıların ona bahşettiği güçleri kendi amaçları uğrana kullanmaya başlayınca işle karışır. '),
                        ),
                        SizedBox(
                          height: _yukseklik * 0.09,
                        ),
                        Center(
                            child: Text(
                          'Yorumlar',
                          style: StyleConst.getNovelPageTitleStyle()
                              .copyWith(fontSize: 25),
                        )),
                        SizedBox(
                          height: _yukseklik * 0.05,
                        ),
                        CommentsAreaWidget(
                            yorumlar: yorumlar,
                            textStyle: StyleConst.getTextColorBlack()),
                      ],
                    ),
                    // Bölümler
                    SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.start,
                      child: Column(
                        children: [
                          NovelChaptersWidget(
                            genislik: _genislik,
                            yukseklik: _yukseklik,
                            chapters: chapters,
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                  tabBarProperties: TabBarProperties(
                      unselectedLabelStyle:
                          TextStyle(color: Colors.grey.shade400)),
                  // ignore: avoid_print
                  onChange: (index) => print(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
