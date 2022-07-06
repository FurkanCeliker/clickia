import 'package:audioplayers/audioplayers.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/novel_chapters_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NovelDetailPage extends StatefulWidget {
  NovelDetailPage({Key? key}) : super(key: key);

  @override
  State<NovelDetailPage> createState() => _NovelDetailPageState();
}

class _NovelDetailPageState extends State<NovelDetailPage> {
  bool isSoundOn = true;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
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
  final audioPlayer = AudioPlayer();
  @override
  void dispose() {
    audioPlayer.dispose();
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

    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying = state == PlayerState.playing;
      audioPlayer.onDurationChanged.listen((newDuration) {
        duration = newDuration;
      });

      audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    });
  }

  Future fetch() async {
    setState(() {
      items.addAll(['İtem M', 'İtem C', 'İtem D']);
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _genislik * 0.1),
              child: Slider(
                  inactiveColor:
                      modeIsLight == true ? Colors.black : Colors.white,
                  thumbColor:
                      modeIsLight == true ? Colors.grey : Colors.blue,
                  activeColor:
                      modeIsLight == true ? Colors.grey : Colors.blue,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  formatTime(position),
                  style: TextStyle(
                      color: modeIsLight == true ? Colors.black : Colors.white),
                ),
                Text(
                  formatTime(duration - position),
                  style: TextStyle(
                      color: modeIsLight == true ? Colors.black : Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor:
                      modeIsLight == true ? Colors.grey : Colors.grey,
                  child: IconButton(
                    icon: Icon(
                      isSoundOn == true ? Icons.volume_up : Icons.volume_off,
                      color: modeIsLight == true ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        audioPlayer.setVolume(isSoundOn == true ? 1 : 0);
                      });
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor:
                      modeIsLight == true ? Colors.grey : Colors.grey,
                  radius: 35,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: modeIsLight == true ? Colors.black : Colors.white,
                    ),
                    iconSize: _yukseklik * 0.05,
                    onPressed: () async {
                      if (isPlaying) {
                        setState(() {});
                        await audioPlayer.pause();
                      } else {
                        String url =
                            'https://radyonet.net/cdn/muzik/charlie-puth-we-dont-talk-anymore-feat-selena-gomez-1653051893-23761.mp3';
                        await audioPlayer.play(DeviceFileSource(url));
                      }
                    },
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: _genislik * 0.08, right: _genislik * 0.04),
                    child: Divider(
                      color: modeIsLight == true ? Colors.grey : Colors.grey,
                      height: _yukseklik * 0.01,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            buildSheet(_genislik, _yukseklik)),
                    icon: Icon(Icons.library_books_outlined,color: modeIsLight==true?Colors.black:Colors.white,)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: _genislik * 0.08, left: _genislik * 0.04),
                    child: Divider(
                      color: modeIsLight == true ? Colors.grey : Colors.grey,
                      height: _yukseklik * 0.01,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => buildSheet(_genislik, _yukseklik)),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    final item = items[index];
                    return ListTile(
                      title: Text(
                        item,
                        style: TextStyle(
                            color: modeIsLight == true
                                ? Colors.black
                                : Colors.white),
                      ),
                    );
                  } else {
                    return Container(
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

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
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
