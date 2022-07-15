import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    Key? key,
    required double genislik,
    required TextEditingController searchController,
  }) : _genislik = genislik, _searchController = searchController, super(key: key);

  final double _genislik;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: _genislik * 0.03, right: _genislik * 0.03),
      child: TextField(
        controller: _searchController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        decoration: const InputDecoration(
            hintText: 'içerik,kişi,tür,ara',
            hintStyle: TextStyle(color: Colors.white70),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
