import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/constants/url.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _kategoriBaslik = [
    'Ah Benim Tatlı Yalancım',
    'Herşey Aşktan',
    'Bin Yıllık Aşk',
    'Aşk Çıkmazı',
    'Mucize Şifacı',
    'Nerde Gönlüm'
  ];
  final List<String> _sliderImageUrlList = [
    'https://clickia.tv//storage/323/624449d31d9b7_lezzetli-kader-10jpg',
    'https://clickia.tv//storage/326/624c2b7595ed8_adsiz-tasarim-11jpg'
  ];
  final List<String> _kategoriAltBaslik = [
    '1525',
    '1642',
    '2453',
    '3337',
    '4099',
    '5235'
  ];
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
          // LOGO VE GİRİŞ YAP
          Padding(
            padding: EdgeInsets.only(
                left: _genislik * 0.03, right: _genislik * 0.03),
            child: HeaderLogoAndLoginButtonWidget(yukseklik: _yukseklik, genislik: _genislik),
          ),
          SizedBox(
            height: _yukseklik * 0.03,
          ),

          //Arama  kısmı
          Padding(
            padding: EdgeInsets.only(
                left: _genislik * 0.03, right: _genislik * 0.03),
            child: TextField(
              controller: _searchController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontSize: 17),
              decoration: const InputDecoration(
                  hintText: 'içerik,kişi,tür,ara',
                  hintStyle: TextStyle(color: Colors.white70),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            height: _yukseklik * 0.08,
          ),

          //1. Slider
          FutureBuilder(
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: (() {}),
                child: CarouselSlider(
                    carouselController: CarouselController(),
                    items: _sliderImageUrlList
                        .map(
                          (e) => SizedBox(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                      width: _genislik,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _yukseklik * 0.02,
                                ),
                                SizedBox(
                                    width: _genislik * 0.2,
                                    child: AnimatedTextKit(animatedTexts: [
                                      FadeAnimatedText('Örnek',
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                          duration:
                                              Duration(milliseconds: 4001))
                                    ])),
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
            height: _yukseklik * 0.13,
          ),
          //2. Slider
          FutureBuilder(
            builder: (context, snapshot) => GestureDetector(
              onTap: (() {}),
              child: CarouselSlider(
                  items: images
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.network(
                                  e,
                                  fit: BoxFit.fill,
                                  width: _genislik * 0.8,
                                )),
                                SizedBox(
                                  height: _yukseklik * 0.01,
                                ),
                                if (e ==
                                    'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png')
                                  const Text(
                                    'İhtişamlı Gençlik',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                              ],
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  )),
            ),
          ),
          SizedBox(
            height: _yukseklik * 0.2,
          ),

          MovieSlider(
            yukseklik: _yukseklik,
            genislik: _genislik,
            kategoriAdi: 'Savaş',
          ),
          
          

          MovieSlider(
            yukseklik: _yukseklik,
            genislik: _genislik,
            kategoriAdi: 'Barış',
          ),

          MovieSlider(
            yukseklik: _yukseklik,
            genislik: _genislik,
            kategoriAdi: 'Popüler',
          ),

          MovieSlider(
            yukseklik: _yukseklik,
            genislik: _genislik,
            kategoriAdi: 'Sürükleyici',
          ),

          SizedBox(
            height: _yukseklik * 0.2,
          ),

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
                  margin: EdgeInsets.only(left: _genislik*0.1,right: _genislik*0.1,top: _yukseklik*0.01),
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
          SizedBox(
            height: _yukseklik * 0.5,
          ),
          const Divider(
            color: Colors.grey,
            height: 10,
          ),
          SizedBox(
            height: _yukseklik * 0.2,
          ),

          socialArea(_yukseklik, _genislik),

          SizedBox(
            height: _yukseklik * 0.1,
          ),
        ],
      ),
    );
  }

  Row socialArea(double _yukseklik, double _genislik) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialLogoWidget(
          yukseklik: _yukseklik,
          genislik: _genislik,
          logoPath: LogoPath.getFaceLogo(),
          socialName: 'Facebook',
        ),
        SocialLogoWidget(
          yukseklik: _yukseklik,
          genislik: _genislik,
          logoPath: LogoPath.getTwitterLogoPath(),
          socialName: 'Twitter',
        ),
        SocialLogoWidget(
          yukseklik: _yukseklik,
          genislik: _genislik,
          logoPath: LogoPath.getInstagramLogo(),
          socialName: 'İnstagram',
        ),
        SocialLogoWidget(
          yukseklik: _yukseklik,
          genislik: _genislik,
          logoPath: LogoPath.getYoutubeLogoPath(),
          socialName: 'YouTube',
        ),
      ],
    );
  }
}

