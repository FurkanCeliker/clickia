import 'package:clickia/constants/screen.dart';
import 'package:clickia/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NovelIcerikSlider extends StatefulWidget {
  List<String> categoryCoverImageList = [];
  NovelIcerikSlider({required List<String> categoryCoverImageList,required List contentTitle,required VoidCallback onTap, Key? key})
      : _categoryCoverImageList = categoryCoverImageList,
      _contentTitle=contentTitle,
      _onTap=onTap,
      
        super(key: key);
  List<String> _categoryCoverImageList;
  List _contentTitle;
  VoidCallback _onTap;

  @override
  State<NovelIcerikSlider> createState() => _NovelIcerikSliderState();
}

class _NovelIcerikSliderState extends State<NovelIcerikSlider> {
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _yukseklik * 0.25,
          width: _genislik * 1,
          child: GridView.builder(
              // Future builder içine al
              itemCount: widget._categoryCoverImageList.length, // apiden gelen veri eklenecek
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    SliderWidget(
                      onTap: (){},
                      yukseklik: _yukseklik,
                      genislik: _genislik,
                      url: widget._categoryCoverImageList[i],
                    ),
                    Expanded(child: Text(widget._contentTitle[i])),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
