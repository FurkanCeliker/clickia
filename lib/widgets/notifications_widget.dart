import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    Key? key,
    required List notificationsList,
    required double genislik,
    required onTap,
  }) : _notificationsList = notificationsList, _genislik = genislik,_onTap=onTap, super(key: key);

  final List _notificationsList;
  final double _genislik;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _notificationsList.length,
      itemBuilder: (context, index) {
      return ListTile(
        onTap: _onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: _genislik*0.02),
        tileColor: Color.fromARGB(255, 62, 57, 57),
        style: ListTileStyle.list,
        leading: Icon(Icons.notification_add,color: Colors.white,size: 30),
        title: Text(_notificationsList[index],style: TextStyle(color: Colors.white),),
      );
    },);
  }
}
