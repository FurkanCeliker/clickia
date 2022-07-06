import 'package:flutter/material.dart';

class NovelChaptersWidget extends StatelessWidget {
  const NovelChaptersWidget({
    Key? key,
    required double genislik,
    required double yukseklik,
    required List chapters,
    required VoidCallback onTap,
  })  : _genislik = genislik,
        _yukseklik = yukseklik,
        _chapters = chapters,
        _onTap = onTap,
        super(key: key);

  final double _genislik;
  final double _yukseklik;
  final List _chapters;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _chapters.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: _onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  )),
              color: index % 2 == 0 ? Colors.white : Color(0xffFBFBFD),
            ),
            width: _genislik,
            height: _yukseklik * 0.07,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: _genislik * 0.05,
                  ),
                  Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    width: _genislik * 0.09,
                  ),
                  Text(_chapters[index]),
                  const Text(''),
                ]),
          ),
        );
      },
    );
  }
}
