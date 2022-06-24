import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: 
            Container(
              height: _yukseklik*1.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'lib/assets/arkaplan.jpg',
                      ),
                      fit: BoxFit.fill,
                      colorFilter:
                          ColorFilter.mode(Colors.black87, BlendMode.darken))),
              child: Column(children: [
                SizedBox(
                  height: _yukseklik * 0.07,
                ),
                Center(
                  child: SizedBox(
                      height: _yukseklik * 0.3,
                      width: _genislik * 0.8,
                      child: Image.asset(LogoPath.getClickiaLogo())),
                ),
                Center(
                  child: Text(
                    'Giriş Yap',
                    style: StyleConst.getTextColorWhite().copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: _yukseklik * 0.03,
                ),
                TextFormFieldWidget(// E-posta Text İnput
                  controllerMail: controllerMail,
                  labelText: 'E-posta',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: _yukseklik * 0.03,
                ),
                TextFormFieldWidget( // Şifre Text İnput
                    controllerMail: controllerPassword,
                    labelText: 'Şifre',
                    textInputType: TextInputType.text),
                SizedBox(
                  height: _yukseklik * 0.03,
                ),
                LoginTypeButton(// Giriş Yap Button
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  textTitle: 'Giriş Yap',
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: _yukseklik * 0.01,
                ),
                Container(// Şifremi unuttum
                  padding: EdgeInsets.only(left: _genislik * 0.7),
                  child: TextButton(
                      child: Text(
                        'Şifremi Unuttum',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                  height: _yukseklik * 0.01,
                ),
                LoginTypeButton(
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  textTitle: 'Bir Hesap Oluşturun',
                  buttonColor: Color(0xffF4630C),
                  textColor: Colors.white,
                ),
                
                
                
                SizedBox(
                  height: _yukseklik*0.09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLogoWidget(yukseklik: _yukseklik*0.6, genislik: _genislik*0.8, logoPath: 'lib/assets/facebook.svg', socialName: 'Facebook'),
                    SocialLogoWidget(yukseklik: _yukseklik*0.6, genislik: _genislik*0.8, logoPath: 'lib/assets/twitter.svg', socialName: 'Twitter'),
                    SocialLogoWidget(yukseklik: _yukseklik*0.6, genislik: _genislik*0.8, logoPath: 'lib/assets/instagram.svg', socialName: 'İnstagram'),
                    SocialLogoWidget(yukseklik: _yukseklik*0.6, genislik: _genislik*0.8, logoPath: 'lib/assets/youtube.svg', socialName: 'YouTube'),
                  ],
                ),
                
              ]),
            ),
          
      ),
    );
  }
}
