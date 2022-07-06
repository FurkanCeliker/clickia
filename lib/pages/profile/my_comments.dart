import 'package:clickia/constants/screen.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:flutter/material.dart';

class MyComments extends StatefulWidget {
  MyComments({Key? key}) : super(key: key);

  @override
  State<MyComments> createState() => _MyCommentsState();
}

class _MyCommentsState extends State<MyComments> {
  final List<Map> yorumlarim = [
    {'Aşkın Santimetresi': 'çok iyiydi', 'Laçin': 'Bir solukta okudum'}
  ];
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Yorumlarım')),backgroundColor: Colors.transparent),
      body: Column(
        children: [
          
          MyCommentsWidget(yorumlarim: yorumlarim, genislik: _genislik),
        ],
      ),
    );
  }
}

class MyCommentsWidget extends StatelessWidget {
  const MyCommentsWidget({
    Key? key,
    required this.yorumlarim,
    required double genislik,
  })  : _genislik = genislik,
        super(key: key);

  final List<Map> yorumlarim;
  final double _genislik;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: yorumlarim[0].length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.black,
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.only(right: _genislik * 0.1),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 30,
                ),
              ]),
            ),
          ),
          key: ValueKey(yorumlarim[0].keys.elementAt(index)),
          onDismissed: (DismissDirection) {
            //Silme Fonksiyonu
          },
          child: ListTile(
            onTap: () {},
            title: Text(
              yorumlarim[0].values.elementAt(index),
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            leading: Icon(
              Icons.comment,
              color: Colors.white,
              size: 40,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(right: _genislik * 0.45),
              child: Container(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    yorumlarim[0].keys.elementAt(index),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
