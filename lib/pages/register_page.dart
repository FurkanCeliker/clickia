import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _registerDateInput= TextEditingController();
  TextEditingController _registerMailController = TextEditingController();
  TextEditingController _registerPasswordController = TextEditingController();
  TextEditingController _registerPasswordTwoController =
      TextEditingController();
  TextEditingController _registerNameController = TextEditingController();
  TextEditingController _registerSurnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: _yukseklik * 1.2,
        width: _genislik,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'lib/assets/arkaplan.jpg',
                ),
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Colors.black87, BlendMode.darken))),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: _yukseklik * 0.2,
                  width: _genislik * 0.8,
                  child: Image.asset(LogoPath.getClickiaLogo())),
            ),
            Center(
              child: Text(
                'Kayıt Ol',
                style: StyleConst.getTextColorWhite().copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormFieldWidget(
              // E-posta Text İnput
              controllerMail: _registerMailController,
              labelText: 'E-posta',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormFieldWidget(
              // E-posta Text İnput
              controllerMail: _registerNameController,
              labelText: 'İsim',
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormFieldWidget(
              // E-posta Text İnput
              controllerMail: _registerSurnameController,
              labelText: 'Soyisim',
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormPasswordWidget(registerPasswordTwoController: _registerPasswordController,labelText: 'Şifre',),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormPasswordWidget(registerPasswordTwoController: _registerPasswordTwoController,labelText: 'Şifre Tekrar',),
            SizedBox(
              height: _yukseklik * 0.03,
            ),
            TextFormField(
      
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        
        fillColor: Color(0xff212020),
        filled: true,
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: false,
      controller: _registerDateInput,
      keyboardType: TextInputType.datetime,
      cursorColor: Colors.white,
    ),
SizedBox(
              height: _yukseklik * 0.03,
            ),    
            LoginTypeButton(
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  textTitle: 'Bir Hesap Oluşturun',
                  buttonColor: Color(0xffF4630C),
                  textColor: Colors.black87,
                ),
          ],
        ),
      ),
    ));
  }
}

class TextFormPasswordWidget extends StatelessWidget {
  const TextFormPasswordWidget({
    Key? key,
    required String labelText,
    required TextEditingController registerPasswordTwoController,
  }) : _registerPasswordTwoController = registerPasswordTwoController,_labelText=labelText, super(key: key);
  final _labelText;
  final TextEditingController _registerPasswordTwoController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: 'Şifre',
        fillColor: Color(0xff212020),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      controller: _registerPasswordTwoController,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.white,
    );
  }
}
