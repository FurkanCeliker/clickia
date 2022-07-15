import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleConst {
  StyleConst._();
  static TextStyle getTextColorWhite() {
    return const TextStyle(color: Colors.white);
  }

  static TextStyle getTextColorBlack() {
    return const TextStyle(color: Colors.black);
  }

  static TextStyle getKategoriSiraSayisiStyle() {
    return const TextStyle(color: Colors.red, fontSize: 20);
  }

  static TextStyle getRankingCategoryTitle() {
    return const TextStyle(color: Colors.white, fontSize: 16);
  }

  static TextStyle getRankingTitleStyle() {
    return const TextStyle(color: Colors.black, fontSize: 16);
  }

  static TextStyle getRankingSubtitleStyle() {
    return const TextStyle(color: Colors.grey, fontSize: 16);
  }

  static TextStyle getRankingNumber() {
    return const TextStyle(color: Colors.red, fontSize: 16);
  }

  static TextStyle getNovelPageCategoryTitle() {
    return const TextStyle(color: Colors.black, fontSize: 20);
  }

  static Color getProfileElevatedButtonColor() {
    return const Color.fromARGB(255, 97, 98, 101);
  }

  static Color getProfileElevatedButtonIconColor() {
    return Colors.orange;
  }

  static TextStyle getProfileElevatedButtonTextStyle() {
    return const TextStyle(fontSize: 18, color: Colors.white);
  }

  static TextStyle getNovelPageTitleStyle() {
    return const TextStyle(color: Colors.black, fontSize: 35);
  }

  static TextStyle getNovelDetailBoldTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }
  static TextStyle getNovelDetailBlack(){
    return const TextStyle(color: Colors.black,fontSize: 20,);
  }
  static TextStyle getMyAccountTextStyle(){
    return const TextStyle(color: Colors.white,fontSize: 15);
  }
  static TextStyle getPaymentsContentsTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontSize: 18,
      
    );
  }
  static getPaymentsTitleStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
    );
  }
}
