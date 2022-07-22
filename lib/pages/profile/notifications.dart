import 'package:clickia/constants/screen.dart';
import 'package:clickia/widgets/my_favorite_list_widget.dart';
import 'package:clickia/widgets/notifications_widget.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List _notificationsList=['Bu bir bildirimdir: yeni güncellemeler ve geliştirmeler hakkında sizlere bir uyarıdır.'];
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:  EdgeInsets.only(right: _genislik*0.1),
          child: Center(child: Text('Bildirimler')),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.pop(context);
          
        }),
        actions:const [Icon(null)],
          backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              NotificationsWidget(notificationsList: _notificationsList, genislik: _genislik,onTap: (){},)
            ],
          ),
    );
  }
}

