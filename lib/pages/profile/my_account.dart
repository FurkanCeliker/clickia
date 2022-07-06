import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController _isimTextfieldController = TextEditingController();
  TextEditingController _soyisimTextfieldController = TextEditingController();
  TextEditingController _numberTextfieldController = TextEditingController();
  TextEditingController _currentPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _newPasswordAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(95, 58, 57, 57),
      body: SingleChildScrollView(
          child: Column(
        children: [
          MyAccountTextFieldWidget(
              yukseklik: _yukseklik,
              textfieldController: _isimTextfieldController,
              content: 'Furkan',
              contentName: 'İsim',
              keyboardType: TextInputType.name,
              genislik: _genislik,
              obscureText: false),
          MyAccountTextFieldWidget(
              contentName: 'Soyisim',
              yukseklik: _yukseklik,
              content: 'Çeliker',
              textfieldController: _soyisimTextfieldController,
              keyboardType: TextInputType.name,
              genislik: _genislik,
              obscureText: false),
          MyAccountTextFieldWidget(
              contentName: 'Telefon',
              yukseklik: _yukseklik,
              content: '05362809317',
              textfieldController: _numberTextfieldController,
              keyboardType: TextInputType.number,
              genislik: _genislik,
              obscureText: false),
          Text(
            'Parolanızı Güncelleyin',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          MyAccountTextFieldWidget(
              contentName: '',
              yukseklik: _yukseklik,
              genislik: _genislik,
              keyboardType: TextInputType.visiblePassword,
              content: 'Mevcut Parola',
              textfieldController: _currentPassword,
              obscureText: true),
          MyAccountTextFieldWidget(
              contentName: '',
              yukseklik: _yukseklik,
              genislik: _genislik,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              content: 'Yeni Parola',
              textfieldController: _newPassword),
          MyAccountTextFieldWidget(
              contentName: '',
              yukseklik: _yukseklik,
              genislik: _genislik,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              content: 'Yeni Parola Tekrar',
              textfieldController: _newPasswordAgain),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _genislik * 0.02),
            child: SizedBox(
              height: _yukseklik * 0.075,
              width: _genislik,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child:const Text(
                  'Parolayı Güncelle',
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      )),
    );
  }
}
