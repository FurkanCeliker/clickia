import 'package:flutter/material.dart';

class MyFavoriteListWidget extends StatelessWidget {
  const MyFavoriteListWidget({
    Key? key,
    required List<Map> myFavorite,
    required double yukseklik,
    required VoidCallback onTap,

  }) : _myFavorite = myFavorite, _yukseklik = yukseklik,_onTap=onTap, super(key: key);

  final List<Map> _myFavorite;
  final double _yukseklik;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      shrinkWrap: true,
      itemCount: _myFavorite[0].length,
      itemBuilder: (context, index) {
       final String values= _myFavorite[0].values.elementAt(index);
       final String keys=_myFavorite[0].keys.elementAt(index);
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: _yukseklik*0.02),
          onTap: _onTap,
          title: Text(
            keys,
            style: TextStyle(color: Colors.white),
          ),
          leading: Image.network(values,),
        );
      },
    );
  }
}
