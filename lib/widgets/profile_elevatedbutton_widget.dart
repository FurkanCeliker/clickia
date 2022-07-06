import 'package:clickia/constants/style.dart';
import 'package:flutter/material.dart';

class ProfileElevatedButtonWidget extends StatelessWidget {
  const ProfileElevatedButtonWidget({
    Key? key,
    required double genislik,
    required double yukseklik,
    required String buttonName,
    required String buttonAssetImageUrl,
    required VoidCallback voidCallback,
  }) : _genislik = genislik, _yukseklik = yukseklik,_buttonName=buttonName,_buttonAssetImageUrl=buttonAssetImageUrl,_voidCallback=voidCallback, super(key: key);

  final double _genislik;
  final double _yukseklik;
  final String _buttonName;
  final String _buttonAssetImageUrl;
  final VoidCallback _voidCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _genislik * 0.05, vertical: _yukseklik * 0.015),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(_yukseklik * 0.02),
              primary: StyleConst.getProfileElevatedButtonColor()),
          onPressed:_voidCallback,
          child: Row(
            
            children: [
              Container(
                  height: _yukseklik * 0.04,
                  width: _genislik*0.07,
                  
                  child: Image.asset(
                    _buttonAssetImageUrl,
                    fit: BoxFit.fill,
                    color: StyleConst.getProfileElevatedButtonIconColor(),
                  )),
                  SizedBox(width: _genislik*0.05,),
              Expanded(
                child: Text(
                  _buttonName,
                  style: StyleConst.getProfileElevatedButtonTextStyle(),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          )),
    );
  }
}
