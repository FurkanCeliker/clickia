import 'package:clickia/constants/logo_path.dart';
import 'package:clickia/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String url,
    required VoidCallback onTap,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _onTap=onTap,
        url = url,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String url;
  final VoidCallback _onTap;

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
    required int kategoriSayisi,
    required double yukseklik,
    required double genislik,
    required List kategoriAdi,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _kategoriSayisi = kategoriSayisi,
        kategoriAdi = kategoriAdi,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final List kategoriAdi;
  final int _kategoriSayisi;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _kategoriSayisi,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _yukseklik * 0.02,
              ),
              Text(
                kategoriAdi[index],
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: _yukseklik * 0.02,
              ),
              SizedBox(
                height: _yukseklik * 0.22,
                width: _genislik * 0.9,
                child: GridView.builder(
                    // Future builder içine al
                    itemCount: 6, // apiden gelen veri eklenecek

                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, i) {
                      return SliderWidget(
                        onTap: (){},
                        yukseklik: _yukseklik,
                        genislik: _genislik,
                        url:
                            'https://clickia.tv//storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png',
                      );
                    }),
              ),
            ],
          );
        });
  }
}

class TextFormPasswordWidget extends StatelessWidget {
  const TextFormPasswordWidget({
    Key? key,
    required String labelText,
    required TextEditingController registerPasswordTwoController,
  })  : _registerPasswordTwoController = registerPasswordTwoController,
        _labelText = labelText,
        super(key: key);
  final String _labelText;
  final TextEditingController _registerPasswordTwoController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: _labelText,
        fillColor: Color(0xff212020),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      controller: _registerPasswordTwoController,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.white,
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
   LoginTypeButton({
    Key? key,
    required String routeName,
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
        _routeName=routeName,
        super(key: key);
  final Color _textColor;
  final double _yukseklik;
  final double _genislik;
  final String _textTitle;
  final Color _buttonColor;
  final String _routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _yukseklik * 0.08,
      width: _genislik,
      decoration: BoxDecoration(
          color: _buttonColor, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed:(){
          Navigator.pushNamed(context, _routeName);
        },
        child: Text(
          _textTitle,
          style: TextStyle(color: _textColor, fontSize: 20),
        ),
      ),
    );
  }
}

class MyAccountTextFieldWidget extends StatelessWidget {
  const MyAccountTextFieldWidget({
    Key? key,
    required String contentName,
    required double yukseklik,
    required double genislik,
    required bool obscureText,
    required TextInputType keyboardType,
    required String content,
    required TextEditingController textfieldController,
  })  : _yukseklik = yukseklik,
        _textfieldController = textfieldController,
        _contentName = contentName,
        _content = content,
        _keyboardType = keyboardType,
        _genislik = genislik,
        _obscureText = obscureText,
        super(key: key);
  final String _contentName;
  final TextInputType _keyboardType;
  final double _yukseklik;
  final double _genislik;
  final String _content;
  final bool _obscureText;
  final TextEditingController _textfieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _contentName,
          style: StyleConst.getMyAccountTextStyle(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _genislik * 0.02),
          child: SizedBox(
            height: _yukseklik * 0.1,
            child: TextField(
                obscureText: _obscureText,
                keyboardType: _keyboardType,
                decoration: InputDecoration(
                    hintText: _content,
                    fillColor: Colors.grey,
                    filled: true,
                    focusColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                maxLength: 20,
                controller: _textfieldController),
          ),
        ),
      ],
    );
  }
}

class HeaderLogoAndLoginButtonWidget extends StatelessWidget {
  const HeaderLogoAndLoginButtonWidget({
    Key? key,
    required double yukseklik,
    required double genislik,
    required String logo,
  })  : _yukseklik = yukseklik,
        _genislik = genislik,
        _logo = logo,
        super(key: key);

  final double _yukseklik;
  final double _genislik;
  final String _logo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 0.1 * _yukseklik,
          width: 0.3 * _genislik,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            '$_logo',
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

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.width - 50);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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
                  onTap: (){},
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
