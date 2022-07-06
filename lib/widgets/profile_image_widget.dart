import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required this.imageUrl,
  }) : _yukseklik = yukseklik, _genislik = genislik, super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _yukseklik * 0.16,
      width: _genislik * 0.3,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
          Positioned(
            bottom: _yukseklik * 0,
            right: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: _yukseklik * 0.07,
                width: _genislik * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image:const DecorationImage(
                        image: AssetImage('lib/assets/camera_icon.png'),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
