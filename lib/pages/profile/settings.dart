import 'package:clickia/constants/screen.dart';
import 'package:clickia/widgets/profile_elevatedbutton_widget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:  EdgeInsets.only(right: _genislik*0.1),
          child: Center(child: Text('Ayarlar'),),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        }),
        actions:const [Icon(null)],
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ProfileElevatedButtonWidget(
              genislik: _genislik,
              yukseklik: _yukseklik,
              buttonName: 'Çıkış Yap',
              buttonAssetImageUrl: 'lib/assets/logout.png',
              voidCallback: () {}),
          ProfileElevatedButtonWidget(
              genislik: _genislik,
              yukseklik: _yukseklik,
              buttonName: 'Hesabımı Sil',
              buttonAssetImageUrl: 'lib/assets/remove.png',
              voidCallback: () {})
        ],
      ),
    );
  }
}
