import 'package:chewie/chewie.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/social_logo_widget.dart';
import 'package:clickia/widgets/visibility_video_widget.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WatchDetailPage extends StatefulWidget {
  WatchDetailPage({Key? key}) : super(key: key);

  @override
  State<WatchDetailPage> createState() => _WatchDetailPageState();
}

List bolumler = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
List<String> videoUrlList = [
  'https://www.youtube.com/embed/wWSbW_u-VdU?autoplay=1&controls=0&disablekb=1&playsinline=1&cc_load_policy=0&cc_lang_pref=auto&widget_referrer=https%3A%2F%2Fclickia.tv%2Fproject%2Fyenilmez%2Fsezon-1%2F1-bolum&noCookie=false&rel=0&showinfo=0&iv_load_policy=3&modestbranding=1&enablejsapi=1&origin=https%3A%2F%2Fclickia.tv&widgetid=1'
];
bool isFavorite = false;
String devaminiOku = 'daha fazla';
int maxLines = 3;
bool vipMi = false;
bool isLike = false;
bool isAddBookshelf=false;
class _WatchDetailPageState extends State<WatchDetailPage> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(videoUrlList[0],
          closedCaptionFile: _loadCaptions()),
    );
  }

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/clickialogowhite.png');
    flickManager.flickControlManager!.toggleSubtitle();
    return SubRipCaptionFile(fileContents);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (vipMi == false)
              VisibilityVideoWidget(seconds: 0)
            else
              Column(
                children: [
                  Container(
                    height: _yukseklik * 0.4,
                    width: _genislik,
                    child: Center(
                      child: Text(
                        'Bu bölümü izleyebilmek için abone olmalısınız!',
                        style: StyleConst.getTextColorWhite(),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: _yukseklik * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You Are So Sweet',
                  style: StyleConst.getTextColorWhite().copyWith(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.011,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '11 Bölüm',
                  style: TextStyle(
                      fontFamily: GoogleFonts.kantumruyTextTheme().toString(),
                      color: Colors.white,
                      fontSize: 12),
                ),
                SizedBox(
                  width: _genislik * 0.015,
                ),
                Container(
                  child: Text(
                    'Gençlik',
                    style: StyleConst.getTextColorWhite().copyWith(
                        fontFamily: GoogleFonts.kantumruyTextTheme().toString(),
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: _genislik * 0.015,
                ),
                Container(
                  width: _genislik * 0.05,
                  height: _yukseklik * 0.02,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      '+16',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontFamily:
                              GoogleFonts.kantumruyTextTheme().toString()),
                    ),
                  ),
                ),
                SizedBox(
                  width: _genislik * 0.015,
                ),
                Text('2020',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.roboto.toString(),
                        fontSize: 12)),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            SingleChildScrollView(
              // Bölümler
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: _yukseklik * 0.05,
                    width: _genislik * 1,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: bolumler.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.grey),
                          height: _yukseklik * 0.09,
                          width: _genislik * 0.1,
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bolumler[index].toString(),
                                  style:
                                      StyleConst.getTextColorWhite().copyWith(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: GoogleFonts.roboto().toString(),
                                  ),
                                ),
                                if (vipMi == true)
                                  Container(
                                    height: _yukseklik * 0.05,
                                    width: _genislik * 0.039,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/vip.jpg'))),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WatchDetailiconButtonWidget(
                    color: Colors.white,
                    icon: Icons.share,
                    onPressed: () {},
                    size: 30),
                WatchDetailiconButtonWidget(
                    color:isLike==false? Colors.white:Colors.blue,
                    icon:Icons.thumb_up,
                    onPressed: () {
                      setState(() {
                        isLike=!isLike;
                      });
                    },
                    size: 30),
                WatchDetailiconButtonWidget(
                    color:isAddBookshelf==false? Colors.white:Colors.blue,
                    icon: Icons.add,
                    onPressed: () {
                      setState(() {
                        isAddBookshelf=!isAddBookshelf;
                      });
                    },
                    size: 30),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Çin dublaj sektöründe ilk defa çalışmaya başlayan bir kız ve onu her daim takip eden patronu ile başlar hikaye. Xia Xiaoning sıradan denebilecek bir kızdır. Çok güzel ya da iyi bir eğitime sahip değil. Şans eseri Gu Chenyu’num asistanı olarak işe alınır. Gu Chenyu’num kimsenin bilmediği bir sırrı vardır. Aslında kendisi en iyi seslendirme sanatçılarından biridir. Xia Xiaoniang ve Gu Chenyu aynı düzeyde olmadıklarında aralarında ki ilişki şenlik doludur. Xia Xiaoniang iş yerinde tutunmaya çalışırken Xie Fei ile bir köpeği kovalamasına yardım ettikten sonra aralarında sınır kalmaz. Yakın zamanda otoriter CEO Xie Fei, Xia Xiaoning’in peşinden koşmaya başlar. Aynı sırada, Xia Xiaoning ve Gu Chenyu farklılıklarını birlikte aşarlar. İki kişi aynı kıza aşık olursa ne olur? Kim seçilir? Beğendiğiniz veya istediğiniz dizileri yorum yaparak bize bildirebilirsiniz. ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines,
                  style: StyleConst.getTextColorWhite().copyWith(
                      fontSize: 13,
                      fontFamily: GoogleFonts.roboto().toString()),
                  softWrap: false,
                ),
                InkWell(
                  onTap: () {
                    if (maxLines == 3) {
                      maxLines = 50;
                      devaminiOku = '';
                    } else if (maxLines == 50) {
                      maxLines = 3;
                    }
                    setState(() {});
                  },
                  child: Text(
                    devaminiOku,
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                )
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.04,
            ),
            MovieSliderV2(
                onTap: () {},
                kategoriSayisi: 1,
                yukseklik: _yukseklik,
                genislik: _genislik,
                imageList: const [
                  'https://clickia.tv//storage/352/6294d6fd2cc08_f464a569-9b55-4a31-8734-0506b7ca1b13jpeg',
                  'https://clickia.tv//storage/336/627c29a447d28_adsiz-tasarim-1jpg',
                  'https://clickia.tv//storage/330/62517cd35cd60_adsiz-tasarim-16jpg',
                  'https://clickia.tv//storage/193/61e5bb2003ea2_Adsız-tasarım-(41).jpg',
                ]),
            SizedBox(
              height: _yukseklik * 0.015,
            ),
            BenzerIceriklerSlider(
              onTap: () {},
              imageList: [
                'https://clickia.tv//storage/380/62c6b3b3d8f1b_62c576384c472-defying-the-stormjpgjpeg',
                'https://clickia.tv//storage/339/6280fd377a035_adsiz-tasarimpng',
                'https://clickia.tv//storage/347/628df35917c9b_adsiz-tasarim-20jpg',
                'https://clickia.tv//storage/332/62518017ceae0_adsiz-tasarim-17jpg',
                'https://clickia.tv//storage/202/61e5cffbd6867_Adsız-tasarım-(50).jpg'
              ],
              yukseklik: _yukseklik,
              genislik: _genislik,
            ),
            SizedBox(
              height: _yukseklik * 0.05,
            )
          ],
        ),
      ),
    );
  }
}

class WatchDetailiconButtonWidget extends StatelessWidget {
  WatchDetailiconButtonWidget({
    required IconData icon,
    required double size,
    required VoidCallback onPressed,
    required Color color,
    Key? key,
  })  : _icon = icon,
        _onPressed = onPressed,
        _size = size,
        _color = color,
        super(key: key);
  final IconData _icon;
  final double _size;
  final VoidCallback _onPressed;
  final Color _color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: _onPressed,
        icon: Icon(
          _icon,
          size: _size,
        ),
        color: _color,
      ),
    );
  }
}
