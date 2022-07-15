import 'package:clickia/constants/screen.dart';
import 'package:clickia/pages/profile/body_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: const [Icon(null)],
        backgroundColor: Colors.black,
      ),
      body: BodyWidget(),
    );
  }
}
