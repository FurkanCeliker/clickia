import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogoWidget extends StatelessWidget {
  const SocialLogoWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String logoPath,
    required String socialName,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _logoPath = logoPath,
        _socialName = socialName,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String _logoPath;
  final String _socialName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _yukseklik * 0.05,
          width: _genislik * 0.08,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: SvgPicture.asset(_logoPath,color: Colors.white,),
          ),
        ),
        SizedBox(
          height: _yukseklik * 0.02,
        ),
        
      ],
    );
  }
}
