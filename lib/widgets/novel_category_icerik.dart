
import 'package:clickia/constants/screen.dart';
import 'package:clickia/widgets/novel_icerik_slider.dart';
import 'package:flutter/material.dart';

class NovelCategoryIcerik extends StatefulWidget {
  NovelCategoryIcerik({Key? key, required VoidCallback onTap,required List<String> categoryImageList, required List categoryTitleList})
      : _onTap = onTap,
        _categoryImageList=categoryImageList,
        _categoryTitleList=categoryTitleList,
        super(
          key: key,
        );
 final VoidCallback _onTap;
  final List _categoryTitleList;
  final List<String> _categoryImageList;

  @override
  State<NovelCategoryIcerik> createState() => _NovelCategoryIcerikState();
}

class _NovelCategoryIcerikState extends State<NovelCategoryIcerik> {
  @override
  Widget build(BuildContext context) {
   
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Column(
      children: [
        NovelIcerikSlider(
            onTap: widget._onTap,
            contentTitle: widget._categoryTitleList,
            categoryCoverImageList: widget._categoryImageList),
        SizedBox(
          height: _yukseklik * 0.1,
        ),
      ],
    );
  }
}
