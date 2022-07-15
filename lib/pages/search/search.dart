import 'package:clickia/constants/screen.dart';
import 'package:clickia/pages/watch_detail/watch_detail_page.dart';
import 'package:clickia/widgets/search_textfield_widget.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Andy",
      "img":
          'https://clickia.tv/storage/257/61eb251113b46_Ads%C4%B1z-tasar%C4%B1m-(94).jpg'
    },
    {
      "id": 2,
      "name": "Aragon",
      "img": 'https://clickia.tv/storage/306/621647024573e_adsiz-tasarim-16jpg'
    },
    {
      "id": 3,
      "name": "Bob",
      "img":
          'https://clickia.tv/storage/310/623a145972ee2_8d23c7ec-5d01-452d-a54e-734a3a5bf838png'
    },
    {
      "id": 4,
      "name": "Barbara",
      "img": 'https://clickia.tv/storage/367/62c453e70939b_adsiz-tasarim-1jpg'
    },
    {
      "id": 5,
      "name": "Candy",
      "img": 'https://clickia.tv/storage/369/62c456d517d26_adsiz-tasarim-3jpg'
    },
    {
      "id": 6,
      "name": "Colin",
      "img": 'https://clickia.tv/storage/379/62c59f55ace45_adsiz-tasarim-8jpg'
    },
  ];
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _yukseklik = Constants.getSizeHeight(context);
    double _genislik = Constants.getSizeWidth(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _genislik * 0.05),
              child: TextField(
                onChanged: (value) => _runFilter(value),
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
            ),
            SizedBox(
              height: _genislik * 0.02,
            ),
            Expanded(
                child: _foundUsers.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: _genislik * 0.02,
                            mainAxisSpacing: _genislik * 0.02,
                            childAspectRatio: 3 / 4,
                            maxCrossAxisExtent: _yukseklik * 0.15),
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => WatchDetailPage(),) );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(_foundUsers[i]['img']),
                                      fit: BoxFit.fill)),
                            ),
                          );
                        })
                    : Text(
                        '',
                        style: TextStyle(color: Colors.white),
                      )),
          ],
        ),
      ),
    );
  }
}
