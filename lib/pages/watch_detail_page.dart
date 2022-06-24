import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WatchDetailPage extends StatefulWidget {
  WatchDetailPage({Key? key}) : super(key: key);

  @override
  State<WatchDetailPage> createState() => _WatchDetailPageState();
}

List<String> videoUrlList = [
  'https://www.youtube.com/embed/wWSbW_u-VdU?autoplay=1&controls=0&disablekb=1&playsinline=1&cc_load_policy=0&cc_lang_pref=auto&widget_referrer=https%3A%2F%2Fclickia.tv%2Fproject%2Fyenilmez%2Fsezon-1%2F1-bolum&noCookie=false&rel=0&showinfo=0&iv_load_policy=3&modestbranding=1&enablejsapi=1&origin=https%3A%2F%2Fclickia.tv&widgetid=1'
];

String devaminiOku = 'Devamını oku';
int maxLines = 6;
bool vipMi = true;

class _WatchDetailPageState extends State<WatchDetailPage> {
  late FlickManager flickManager;
  @override
  void initState() {
    // TODO: implement initState
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
            HeaderLogoAndLoginButtonWidget(
                yukseklik: _yukseklik, genislik: _genislik),
            SizedBox(
              height: _yukseklik * 0.1,
            ),
            if (vipMi == false)
              VisibilityDetector(
                key: ObjectKey(flickManager),
                onVisibilityChanged: (visibility) {
                  if (visibility.visibleFraction == 0 && this.mounted) {
                    flickManager.flickControlManager!.autoPause();
                  } else if (visibility.visibleFraction == 1) {
                    flickManager.flickControlManager?.autoResume();
                  }
                },
                child: Container(
                  height: _yukseklik * 0.4,
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: FlickVideoWithControls(
                      closedCaptionTextStyle: TextStyle(fontSize: 8),
                      controls: FlickPortraitControls(),
                    ),
                    flickVideoWithControlsFullscreen: FlickVideoWithControls(
                      controls: FlickLandscapeControls(),
                    ),
                  ),
                ),
              )
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
              height: _yukseklik * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (vipMi == true)
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/vip.jpg'))),
                    height: _yukseklik * 0.05,
                    width: _genislik * 0.08,
                  ),
                Text(
                  'You Are So Sweet',
                  style: StyleConst.getTextColorWhite().copyWith(fontSize: 25),
                ),
                IconButton(
                  onPressed: () {},
                  color: Colors.orange,
                  icon: const Icon(Icons.favorite_outline_rounded),
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.05,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    height: _yukseklik * 0.05,
                    width: _genislik * 1,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Container(
                          height: _yukseklik * 0.08,
                          width: _genislik * 0.1,
                          child: FloatingActionButton(
                            focusColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  '12',
                                  style: StyleConst.getTextColorWhite()
                                      .copyWith(fontSize: 21),
                                ),
                                if (vipMi == true)
                                  Container(
                                    height: _yukseklik * 0.05,
                                    width: _genislik * 0.039,
                                    decoration: BoxDecoration(
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
              height: _yukseklik * 0.1,
            ),
            Row(
              //Alt Başlık ve bölüm numarası
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(
                  width: _genislik * 0.08,
                ),
                Text('You Are So Sweet',
                    style:
                        StyleConst.getTextColorWhite().copyWith(fontSize: 20)),
                SizedBox(
                  width: _genislik * 0.09,
                ),
                Text(
                  '1. Bölüm',
                  style: StyleConst.getTextColorWhite().copyWith(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: _genislik * 0.08,
                ),
                Text(
                  'Toplam 11 Bölüm',
                  style: StyleConst.getTextColorWhite(),
                ),
                SizedBox(
                  width: _genislik * 0.04,
                ),
                Container(
                  color: Colors.grey.shade800,
                  child: Text(
                    'Gençlik',
                    style: StyleConst.getTextColorWhite(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: _genislik * 0.08, left: _genislik * 0.07),
              child: Column(
                children: [
                  Text(
                    'Çin dublaj sektöründe ilk defa çalışmaya başlayan bir kız ve onu her daim takip eden patronu ile başlar hikaye. Xia Xiaoning sıradan denebilecek bir kızdır. Çok güzel ya da iyi bir eğitime sahip değil. Şans eseri Gu Chenyu’num asistanı olarak işe alınır. Gu Chenyu’num kimsenin bilmediği bir sırrı vardır. Aslında kendisi en iyi seslendirme sanatçılarından biridir. Xia Xiaoniang ve Gu Chenyu aynı düzeyde olmadıklarında aralarında ki ilişki şenlik doludur. Xia Xiaoniang iş yerinde tutunmaya çalışırken Xie Fei ile bir köpeği kovalamasına yardım ettikten sonra aralarında sınır kalmaz. Yakın zamanda otoriter CEO Xie Fei, Xia Xiaoning’in peşinden koşmaya başlar. Aynı sırada, Xia Xiaoning ve Gu Chenyu farklılıklarını birlikte aşarlar. İki kişi aynı kıza aşık olursa ne olur? Kim seçilir? Beğendiğiniz veya istediğiniz dizileri yorum yaparak bize bildirebilirsiniz. ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                    style: StyleConst.getTextColorWhite(),
                    softWrap: false,
                  ),
                  TextButton(
                      onPressed: () {
                        if (maxLines == 6) {
                          maxLines = 50;
                          devaminiOku = '';
                        } else if (maxLines == 50) {
                          maxLines = 6;
                        }
                        setState(() {});
                      },
                      child: Text(
                        devaminiOku,
                        style: TextStyle(color: Colors.orange),
                      )),
                ],
              ),
            ),
            Text(
              'Bezer İçerikler',
              style: TextStyle(
                  color: Color.fromARGB(255, 202, 155, 1), fontSize: 25),
            ),
            SizedBox(
              height: _yukseklik * 0.04,
            ),
            BenzerIceriklerSlider(
              yukseklik: _yukseklik,
              genislik: _genislik,
            ),
            SizedBox(
              height: _yukseklik * 0.04,
            ),
            BenzerIceriklerSlider(
              yukseklik: _yukseklik,
              genislik: _genislik,
            ),
            SizedBox(
              height: _yukseklik * 0.04,
            ),
            BenzerIceriklerSlider(
              yukseklik: _yukseklik,
              genislik: _genislik,
            ),
            SizedBox(
              height: _yukseklik * 0.09,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Yorumlar',
                  style: StyleConst.getTextColorWhite().copyWith(fontSize: 25),
                ),
                SizedBox(
                  height: _yukseklik * 0.05,
                ),
                SizedBox(
                  height: _yukseklik * 0.2,
                  width: _genislik,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'Ahmet',
                          style: StyleConst.getTextColorWhite(),
                        ),
                        subtitle: Text('asdasdsada',style: StyleConst.getTextColorWhite(),),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.network(
                              'https://www.puzzledepo.com/skins/shared/images/yeni-uyelik.png'),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/facebook.svg',
                    socialName: 'Facebook'),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/twitter.svg',
                    socialName: 'Twitter'),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/instagram.svg',
                    socialName: 'İnstagram'),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/youtube.svg',
                    socialName: 'YouTube'),
              ],
            ),
            SizedBox(
              height: _yukseklik * 0.09,
            ),
          ],
        ),
      ),
    );
  }
}
