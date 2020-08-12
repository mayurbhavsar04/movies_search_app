import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_search_app/model/imdb_movie_data_model.dart';
import 'package:movies_search_app/provider_service/provider_class.dart';
import 'package:movies_search_app/widget/demo_content_widget.dart';
import 'package:movies_search_app/widget/home_screen_content_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  getData(String title) async {
    final ProviderClass providerClass = Provider.of<ProviderClass>(context);
    MovieDataModel movieData = await providerClass.getMovieData(title);
    providerClass.setData(movieData);
  }

  @override
  Widget build(BuildContext context) {
    final ProviderClass providerClass = Provider.of<ProviderClass>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (String str) {
                  providerClass.searchMovie(str);
                  print(str);
                },
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Expanded(
              child: Container(
                  child: Provider.of<ProviderClass>(context).isLOading
                      ? DemoContentWidget()
                      : HomeScreenContentWidget()),
            ),
          ],
        ));
  }
}
