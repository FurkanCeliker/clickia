import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VisiblilityImageWidget extends StatefulWidget {
  const VisiblilityImageWidget({
    Key? key,
    required List sliderImageList,
    required int seconds,
  })  : _sliderImageList = sliderImageList,
        _seconds = seconds,
        super(key: key);

  final List _sliderImageList;
  final int _seconds;

  @override
  State<VisiblilityImageWidget> createState() => _VisiblilityImageWidgetState();
}

class _VisiblilityImageWidgetState extends State<VisiblilityImageWidget> {
  bool _visibleImage = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: widget._seconds), () {
      if (this.mounted) {
        setState(() {
          _visibleImage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visibleImage,
      maintainState: true,
      maintainAnimation: true,
      child: CarouselSlider.builder(
          itemCount: widget._sliderImageList.length,
          itemBuilder: (context, itemIndex, realIndex) {
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage(widget._sliderImageList[itemIndex]))));
          },
          options: CarouselOptions(
            viewportFraction: 8,
            autoPlay: false,
          )),
    );
  }
}
