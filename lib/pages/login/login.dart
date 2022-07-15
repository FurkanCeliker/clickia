import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/home/home_page.dart';
import 'package:clickia/pages/register/register_page.dart';
import 'package:clickia/widgets/social_logo_widget.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:clickia/route/route.dart' as route;

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
        child: Container(
          height: _yukseklik * 1.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'lib/assets/arkaplan.jpg',
                  ),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black87, BlendMode.darken))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: _yukseklik * 0.05,
            ),
            Center(
              child: SizedBox(
                  height: _yukseklik * 0.2,
                  width: _genislik * 0.5,
                  child: Image.asset(LogoPath.getClickiaLogo())),
            ),
            Container(
              width: _genislik * 0.6,
              height: _yukseklik * 0.07,
              child: TextFormFieldWidget(
                // E-posta Text İnput
                controllerMail: controllerMail,
                labelText: 'E-posta',
                textInputType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Container(
              height: _yukseklik * 0.07,
              width: _genislik * 0.6,
              child: TextFormFieldWidget(
                  // Şifre Text İnput
                  controllerMail: controllerPassword,
                  labelText: 'Şifre',
                  textInputType: TextInputType.text),
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Container(
              //90deg, #ffdf89 0, #f2ca5b 100%
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffffdf89), Color(0xfff2ca5b)])),
              child: LoginTypeButton(
                // Giriş Yap Button
                routeName: HomePage(),
                yukseklik: _yukseklik * 0.8,
                genislik: _genislik * 0.6,
                textTitle: 'Giriş Yap',
                textColor: Color.fromARGB(255, 37, 43, 3),
                buttonColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: LoginTypeButton(
                buttonColor: Colors.white,
                routeName: RegisterPage(),
                yukseklik: _yukseklik * 0.8,
                genislik: _genislik * 0.6,
                textTitle: 'Hesap Oluştur',
                textColor: Color.fromARGB(255, 34, 33, 33),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.01,
            ),
            Center(
              child: TextButton(
                  child: Text(
                    'Şifremi Unuttum',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, route.profilePage);
                  }),
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
                    socialName: ''),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/twitter.svg',
                    socialName: ''),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/instagram.svg',
                    socialName: ''),
                SocialLogoWidget(
                    yukseklik: _yukseklik * 0.6,
                    genislik: _genislik * 0.8,
                    logoPath: 'lib/assets/youtube.svg',
                    socialName: ''),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
