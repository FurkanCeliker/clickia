import 'package:clickia/constants/logo_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String url,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        url = url,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        height: _yukseklik * 0.2,
        width: _genislik * 0.3,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Image.network(url),
      ),
    );
  }
}

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String kategoriAdi,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        kategoriAdi = kategoriAdi,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String kategoriAdi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kategoriAdi,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        SizedBox(
          height: _yukseklik * 0.22,
          width: _genislik * 0.9,
          child: GridView.builder(
              // Future builder içine al
              itemCount: 6, // apiden gelen veri eklenecek

              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, i) {
                return SliderWidget(
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  url:
                      'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png',
                );
              }),
        ),
      ],
    );
  }
}

class SocialLogoWidget extends StatelessWidget {
  const SocialLogoWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String logoPath,
    required String socialName,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _logoPath = logoPath,
        _socialName = socialName,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String _logoPath;
  final String _socialName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _yukseklik * 0.05,
          width: _genislik * 0.08,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            child: SvgPicture.asset(_logoPath),
          ),
        ),
        SizedBox(
          height: _yukseklik * 0.02,
        ),
        Text(
          _socialName,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.controllerMail,
    required this.labelText,
    required this.textInputType,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controllerMail;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: labelText,
        fillColor: Color(0xff212020),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: false,
      controller: controllerMail,
      keyboardType: textInputType,
      cursorColor: Colors.white,
    );
  }
}

class LoginTypeButton extends StatelessWidget {
  const LoginTypeButton({
    Key? key,
    required double yukseklik,
    required Color textColor,
    required double genislik,
    required String textTitle,
    required Color buttonColor,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _textTitle = textTitle,
        _buttonColor = buttonColor,
        _textColor = textColor,
        super(key: key);
  final Color _textColor;
  final double _yukseklik;
  final double _genislik;
  final String _textTitle;
  final Color _buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _yukseklik * 0.08,
      width: _genislik,
      decoration: BoxDecoration(
          color: _buttonColor, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          _textTitle,
          style: TextStyle(color: _textColor, fontSize: 20),
        ),
      ),
    );
  }
}

class HeaderLogoAndLoginButtonWidget extends StatelessWidget {
  const HeaderLogoAndLoginButtonWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        super(key: key);

  final double _yukseklik;
  final double _genislik;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 0.1 * _yukseklik,
          width: 0.3 * _genislik,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'lib/assets/clickialogowhite.png',
          ))),
        ),
        SizedBox(
          height: _yukseklik * 0.07,
          width: _genislik * 0.25,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Giriş Yap'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffF05B0B),
            ),
          ),
        )
      ],
    );
  }
}

class BenzerIceriklerSlider extends StatelessWidget {
  const BenzerIceriklerSlider({
    Key? key,
    required double yukseklik,
    required double genislik,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        super(key: key);

  final double _yukseklik;
  final double _genislik;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _yukseklik * 0.22,
          width: _genislik * 0.9,
          child: GridView.builder(
              // Future builder içine al
              itemCount: 6, // apiden gelen veri eklenecek

              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, i) {
                return SliderWidget(
                  yukseklik: _yukseklik,
                  genislik: _genislik,
                  url:
                      'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png',
                );
              }),
        ),
      ],
    );
  }
}
