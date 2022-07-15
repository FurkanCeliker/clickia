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
  List mangas = [
    'https://w7.pngwing.com/pngs/772/867/png-transparent-mangaka-arm-anime-joint-cartoon-couples-black-hair-manga-cartoon.png',
    'https://i.pinimg.com/736x/f6/10/97/f610978ed5813dd6014084e1181191dc.jpg',
    'https://i.pinimg.com/originals/ac/59/c6/ac59c631fb4b3451981d0c0d4d9dd15b.jpg',
  ];

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
      mangas.addAll([
        'https://static.zerochan.net/Hyouka.full.3524264.png',
        'https://www.hisglobal.com.tr/assets/images/uploads/1600094393.jpg',
        'https://static.wikia.nocookie.net/e302e675-663b-4033-80bf-a68b11ed605e'
      ]);
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
            // Ses dosya kısmı

            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => buildSheet(_genislik, _yukseklik)),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mangas.length,
                itemBuilder: (context, index) {
                  final item = mangas[index];
                  return Container(
                    width: _genislik,
                    height: _yukseklik,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(mangas[index]),fit: BoxFit.fill)),
                  );
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
