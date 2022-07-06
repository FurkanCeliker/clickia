import 'package:clickia/constants/style.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:flutter/material.dart';

class CommentsAreaWidget extends StatelessWidget {
   CommentsAreaWidget({
   required List yorumlar,
   required TextStyle textStyle,
    Key? key,
  }) :_yorumlar=yorumlar,_textStyle=textStyle, super(key: key);
  List _yorumlar;
  TextStyle _textStyle;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         itemCount: yorumlar[0].length,
         itemBuilder: (context, index) {
           return ListTile(
             title: Text(
               yorumlar[0].keys.elementAt(index),
               style:_textStyle
             ),
             subtitle: Text(
               yorumlar[0].values.elementAt(index),
               style: _textStyle,
             ),
             leading: CircleAvatar(
               backgroundColor: Colors.transparent,
               child: Image.network(
                   'https://www.puzzledepo.com/skins/shared/images/yeni-uyelik.png'),
             ),
           );
         },
       );
  }
}
