import 'package:flutter/material.dart';

class MyFavoriteListWidget extends StatelessWidget {
  const MyFavoriteListWidget({
    Key? key,
    required List<Map> myFavorite,
    required double yukseklik,
    required VoidCallback onTap,
  })  : _myFavorite = myFavorite,
        _yukseklik = yukseklik,
        _onTap = onTap,
        super(key: key);

  final List<Map> _myFavorite;
  final double _yukseklik;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: _yukseklik * 0.02,
          mainAxisSpacing: _yukseklik * 0.02,
          childAspectRatio: 3 / 4,
          maxCrossAxisExtent: _yukseklik * 0.15),
      shrinkWrap: true,
      itemCount: _myFavorite.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: _onTap,
          child: Card(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(_myFavorite[index]['img']),
                        fit: BoxFit.cover))),
          ),
        );
      },
    );
  }
}
