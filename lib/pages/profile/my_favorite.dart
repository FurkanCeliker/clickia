import 'dart:ffi';

import 'package:clickia/constants/screen.dart';
import 'package:clickia/widgets/my_favorite_list_widget.dart';
import 'package:flutter/material.dart';

class MyFavorite extends StatefulWidget {
  MyFavorite({Key? key}) : super(key: key);

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  final List<Map> _myFavorite = [
    {
      'Gençliğe Selam Dur':
          'https://puui.qpic.cn/vcover_hz_pic/0/mzc00200v3lnbmd1650207570814/0',
          'Başımın Tatlı Belası':'https://puui.qpic.cn/vcover_hz_pic/0/mzc00200moikwsy1651722687454/0'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:const Center(
          child: Text(
            'Favorilerim',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      body: Column(
        children: [
          MyFavoriteListWidget(myFavorite: _myFavorite, yukseklik: _yukseklik,onTap: (){},),
        ],
      ),
    );
  }
}

