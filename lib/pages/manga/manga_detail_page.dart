import 'package:audioplayers/audioplayers.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/novel_chapters_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MangaDetailPage extends StatefulWidget {
  MangaDetailPage({Key? key}) : super(key: key);

  @override
  State<MangaDetailPage> createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  List mangas=['https://i.pinimg.com/736x/5b/2b/a6/5b2ba63d77dcc42614011954a749b73d.jpg','https://i.pinimg.com/236x/00/a3/33/00a33349c21fa3f730bb7201f232b937--great-quotes-seven-deadly-sins.jpg','https://i.pinimg.com/236x/4d/b9/fb/4db9fb0a583b4695afb106fb59455d72--pse-kyoto.jpg',];
 
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
  final controller = ScrollController();
  List<String> items = List.generate(
    50,
    (index) => 'Item ${index + 1}',
  );
  bool modeIsLight = true;
  int _pageSize = 3;
  List<String> _chapters = [
    'Bölüm 1: Beklenmeyen Ölüm Laçin, çadırın dışındaki ağıtları ve bağrışmaları duyarak uyandı. İçlerinden bir ses tanıdık geldi. Annesinin sesi! Hemen kendini dışarı attı.Hava çok soğuktu ve rüzgâr adeta suratını kesiyordu. Kalabalığa yaklaştığında annesini yerde, birinin başında ağlarken buldu. Düşündüğü şey olmuş olamazdı. Hayır, yerde yatan kişi babası değildi!'
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
      ;
    });

    

      
  }

  Future fetch() async {
    setState(() {
      mangas.addAll(['https://static.zerochan.net/Hyouka.full.3524264.png', 'https://www.hisglobal.com.tr/assets/images/uploads/1600094393.jpg', 'https://static.wikia.nocookie.net/e302e675-663b-4033-80bf-a68b11ed605e']);
    });
  }

  String imageUrl =
      'https://img.webnovel.com/bookcover/18549008105094005/600/600.jpg?coverUpdateTime=1636927397380&imageMogr2/quality/40';

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      backgroundColor: modeIsLight == true ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: _yukseklik * 0.05),
              child: Center(
                child: Container(
                  height: _yukseklik * 0.35,
                  width: _genislik * 0.40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.solid),
                      ],
                      border: Border.all(color: Colors.blue),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                ),
              ),
            ),
            // Ses dosya kısmı

            SizedBox(
              height: _yukseklik * 0.05,
            ),
           
            
            
            SizedBox(
              height: _yukseklik * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Translator:',
                  style: TextStyle(
                      color: modeIsLight == true ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Nomyummi',
                  style: TextStyle(
                      color: modeIsLight == true ? Colors.black : Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Editör:',
                  style: modeIsLight == true
                      ? StyleConst.getNovelDetailBoldTextStyle()
                      : StyleConst.getNovelDetailBoldTextStyle()
                          .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: _yukseklik * 0.08,
                ),
                Text('Gravity Tales',
                    style: modeIsLight == true
                        ? StyleConst.getNovelDetailBlack()
                        : StyleConst.getNovelDetailBlack()
                            .copyWith(color: Colors.white)),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.05,
            ),
            
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => buildSheet(_genislik, _yukseklik)),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mangas.length + 1,
                itemBuilder: (context, index) {
                  if (index < mangas.length) {
                    final item = mangas[index];
                    return Image.network(mangas[index]);
                  } else {
                    return  Container(
                      child: Center(
                        child: LinearProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSheet(double _genislik, double _yukseklik) {
    return Container(
        padding: const EdgeInsets.all(20),
        height: _yukseklik * 0.2,
        color: modeIsLight == true ? Colors.white : Colors.black,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        context: context,
                        builder: (context) => buildChapterMenu(
                            _yukseklik, _genislik, () {}, chapters));
                  },
                  icon: Icon(Icons.menu),
                  color: modeIsLight == true ? Colors.black : Colors.white,
                  iconSize: _yukseklik * 0.05,
                ),
                IconButton(
                  onPressed: () {
                    this.setState(() {
                      modeIsLight = !modeIsLight;
                    });
                    
                  },
                  icon: modeIsLight == true
                      ? Icon(Icons.mode_night)
                      : Icon(Icons.light_mode),
                  iconSize: _yukseklik * 0.05,
                  color: modeIsLight == true ? Colors.black : Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    setState() {}
                  },
                  icon: Icon(Icons.abc),
                  iconSize: _yukseklik * 0.05,
                  color: modeIsLight == true ? Colors.black : Colors.white,
                ),
              ],
            );
          },
        ));
  }

  

  Container buildChapterMenu(yukseklik, genislik, onTap, List chapters) {
    return Container(
      height: yukseklik * 12,
      child: ListView.builder(
        itemCount: chapters.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    )),
                color: index % 2 == 0 ? Colors.white : Color(0xffFBFBFD),
              ),
              width: genislik,
              height: yukseklik * 0.07,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: genislik * 0.05,
                    ),
                    Text(
                      '${index + 1}',
                      style: StyleConst.getNovelDetailBlack(),
                    ),
                    SizedBox(
                      width: yukseklik * 0.09,
                    ),
                    Text(chapters[index]),
                    const Text(''),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
