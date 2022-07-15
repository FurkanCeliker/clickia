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
        appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: _yukseklik*0.05),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        'İsim',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        yukseklik: _yukseklik,
                        textfieldController: _isimTextfieldController,
                        content: 'Furkan',
                        contentName: 'İsim',
                        keyboardType: TextInputType.name,
                        genislik: _genislik,
                        obscureText: false),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        'Soyisim',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        contentName: 'Soyisim',
                        yukseklik: _yukseklik,
                        content: 'Çeliker',
                        textfieldController: _soyisimTextfieldController,
                        keyboardType: TextInputType.name,
                        genislik: _genislik,
                        obscureText: false),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        'Numara',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        contentName: 'Telefon',
                        yukseklik: _yukseklik,
                        content: '05362809317',
                        textfieldController: _numberTextfieldController,
                        keyboardType: TextInputType.number,
                        genislik: _genislik,
                        obscureText: false),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        'Parolanızı Güncelleyin',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        contentName: '',
                        yukseklik: _yukseklik,
                        genislik: _genislik,
                        keyboardType: TextInputType.visiblePassword,
                        content: 'Mevcut Parola',
                        textfieldController: _currentPassword,
                        obscureText: true),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        '',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        contentName: '',
                        yukseklik: _yukseklik,
                        genislik: _genislik,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        content: 'Yeni Parola',
                        textfieldController: _newPassword),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _genislik * 0.025, bottom: _yukseklik * 0.003),
                      child: Text(
                        '',
                        style: StyleConst.getMyAccountTextStyle().copyWith(),
                      ),
                    ),
                    MyAccountTextFieldWidget(
                        contentName: '',
                        yukseklik: _yukseklik,
                        genislik: _genislik,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        content: 'Yeni Parola Tekrar',
                        textfieldController: _newPasswordAgain),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _genislik * 0.02,
                          vertical: _yukseklik * 0.04),
                      child: SizedBox(
                        height: _yukseklik * 0.06,
                        width: _genislik * 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: const Text(
                            'Parolayı Güncelle',
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              
            ),
          ),
        ));
  }
}
