import 'package:flutter/material.dart';

class DiziFilmMangaKategoriWidget extends StatelessWidget {
  const DiziFilmMangaKategoriWidget({
    Key? key,
    required VoidCallback onTap,
    required double yukseklik,
    required double genislik,
    required String simgePath,
    required String categoryName,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _simgePath = simgePath,
        _categoryName=categoryName,
        _onTap=onTap,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String _simgePath;
  final String _categoryName;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: _onTap,
        child: Container(
          decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          child: Column(
            children: [
              Container(
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage(_simgePath),
              ),),
            height: _yukseklik * 0.06,
            width: _genislik * 0.14,
            
          ),
          Text(_categoryName),
            ],
          ),
        ));
  }
}
