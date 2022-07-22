
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
      'id':0,
      'name': 'Gençliğe Selam Dur',
      'img':'https://puui.qpic.cn/vcover_hz_pic/0/mzc00200v3lnbmd1650207570814/0',
          
    },
    { 
      'id':1,
      'name':'Başımın Tatlı Belası',
      'img':'https://puui.qpic.cn/vcover_hz_pic/0/mzc00200moikwsy1651722687454/0'
    },
    {
      'id':2,
      'name':'Komşuda Aşk',
      'img':'https://clickia.tv/storage/227/61e7f13811b75_Adsız-tasarım-(61).jpg'
    },
    {
      'id':3,
      'name':'Tesadüfi Dünya',
      'img':'https://clickia.tv/storage/64/61deb0b22f595_Ads%C4%B1z-tasar%C4%B1m.jpg'
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:  EdgeInsets.only(right: _genislik*0.1),
          child: Center(child: Text('Favorilerim')),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
        }),
        actions:const [Icon(null)],
        backgroundColor: Colors.transparent,
        
      ),
      body: Column(
        children: [
          MyFavoriteListWidget(myFavorite: _myFavorite, yukseklik: _yukseklik,onTap: (){},),
        ],
      ),
    );
  }
}

