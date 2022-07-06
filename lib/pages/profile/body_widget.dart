import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:clickia/widgets/profile_elevatedbutton_widget.dart';
import 'package:clickia/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:clickia/route/route.dart' as route;

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String profileButtonImageUrl='lib/assets/user.png';
    String favoriteIcon='lib/assets/favorite.png';
    String clockButtonImageUrl='lib/assets/clock.png';
    String commentButtonImageUrl='lib/assets/comments.png';
    String paymentButtonImageUrl='lib/assets/payment.png';
    String settingsButtonImageUrl='lib/assets/settings.png';
    String notifications='lib/assets/notification.png';
    String logOut='lib/assets/logout.png';
    String imageUrl =
        'https://play-lh.googleusercontent.com/I-Yd5tJnxw7Ks8FUhUiFr8I4kohd9phv5sRFHG_-nSX9AAD6Rcy570NBZVFJBKpepmc=w240-h480-rw';
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Column(
      
      children: [
        ProfileImageWidget(
            yukseklik: _yukseklik, genislik: _genislik, imageUrl: imageUrl),
        SizedBox(
          height: _yukseklik * 0.08,
        ),
        ProfileElevatedButtonWidget(genislik: _genislik, yukseklik: _yukseklik,buttonAssetImageUrl: profileButtonImageUrl,buttonName: 'Hesabım',voidCallback: (){Navigator.pushNamed(context, route.myAccountPage);}),
        ProfileElevatedButtonWidget(genislik: _genislik, yukseklik: _yukseklik,buttonAssetImageUrl: favoriteIcon,buttonName: 'Favorilerim',voidCallback: (){}),
        ProfileElevatedButtonWidget(genislik: _genislik, yukseklik: _yukseklik,buttonAssetImageUrl: paymentButtonImageUrl,buttonName: 'Ödemelerim',voidCallback: (){}),
        ProfileElevatedButtonWidget(genislik: _genislik, yukseklik: _yukseklik,buttonAssetImageUrl: notifications,buttonName: 'Bildirimler',voidCallback: (){}),
        ProfileElevatedButtonWidget(genislik: _genislik, yukseklik: _yukseklik,buttonAssetImageUrl: settingsButtonImageUrl,buttonName: 'Ayarlar',voidCallback: (){}),
      
      ],
    );
  }
}

