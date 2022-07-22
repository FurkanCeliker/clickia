import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/novel/novel_detail_page.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
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
  bool _isLike=false;
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
  List<Map<dynamic,dynamic>> _yorumlar=[{'id':'1','adi':'selçuk','yorum':'Çok iyiydi','tarih':'19.07.2022'},{'id':'1','adi':'Kürşat','yorum':'İçerik çok kaliteli','tarih':'19.07.2022'},{'id':'1','adi':'Yalçın','yorum':'Devam etmeli merakla takip ediyorum','tarih':'19.07.2022'}];
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
                    boxShadow:const [
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: _genislik * 0.07),
                  child: Text(
                    'Laçin',
                    style: StyleConst.getNovelPageTitleStyle(),
                  ),
                ),
                WatchDetailiconButtonWidget(
                  color: _isLike == false ? Colors.grey : Colors.blue,
                  icon: Icons.thumb_up,
                  onPressed: (){
                    setState(() {
                      _isLike=!_isLike;
                    });
                  },
                  size: 22,
                )
              ],
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
               const Icon(Icons.bookmark),
                SizedBox(
                  width: _genislik * 0.03,
                ),
               const Text('Tarihi'),
                SizedBox(
                  width: _genislik * 0.03,
                ),
               const Icon(Icons.file_open),
                SizedBox(
                  width: _genislik * 0.03,
                ),
               const Text('10 Bölüm'),
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
                    buttonColor: const Color(0xff2850E0),
                    buttonContent: Text('Okumaya Başla!'),
                    onTapButton: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NovelDetailPage(),));
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
                        
                        SizedBox(height: _yukseklik*0.15,),
                         Padding(
                           padding:  EdgeInsets.only(left: _genislik*0.05),
                           child: Text('Yorumlar',style: TextStyle(color: Colors.black,fontSize: 25)),
                         ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _yorumlar.length,
                          itemBuilder: (context, index) {
                          Map<dynamic,dynamic> yorum= _yorumlar[index];
                          return ListTile(        
                            leading:  Icon(Icons.comment,size: 30,color: Colors.black,),
                            title: Text(yorum['adi'],style: TextStyle(fontSize: 18),),
                            subtitle: Text(yorum['yorum']),
                            trailing: Text(yorum['tarih']),
                          );
                        },),
                        
                        
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
