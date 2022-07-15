import 'package:clickia/constants/screen.dart';
import 'package:clickia/constants/style.dart';
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final Map payments = {
    'paymentDate': '1/1/2021',
    'paymentContent': 'Bussines Plan',
    'paymentTotal': '80'
  };
  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [Icon(null)],
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {Navigator.pop(context);},
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Payments Title
            Padding(
              padding: EdgeInsets.only(
                  left: _genislik * 0.045,
                  right: _genislik * 0.045,
                  top: _yukseklik * 0.02),
              child: Container(
                height: _yukseklik * 0.07,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Colors.white,
                          blurStyle: BlurStyle.normal)
                    ],
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey)),
                    color: Colors.grey),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tarih',
                        style: StyleConst.getPaymentsTitleStyle(),
                      ),
                      Text(
                        'Açıklama',
                        style: StyleConst.getPaymentsTitleStyle(),
                      ),
                      Text(
                        'Tutar',
                        style: StyleConst.getPaymentsTitleStyle(),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: _yukseklik * 0.05,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: payments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: _genislik * 0.045, right: _genislik * 0.045),
                  child: Container(
                    height: _yukseklik * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        border:
                            Border(bottom: BorderSide(color: Colors.white))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                            itemCount: payments.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: _genislik * 0.10,
                                  ),
                                  Text(
                                    payments.values.elementAt(index),
                                    style: StyleConst
                                        .getPaymentsContentsTextStyle(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ]),
                  ),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
