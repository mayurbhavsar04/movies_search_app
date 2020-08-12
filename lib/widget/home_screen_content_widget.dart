import 'package:flutter/material.dart';
import 'package:movies_search_app/model/imdb_movie_data_model.dart';
import 'package:movies_search_app/provider_service/provider_class.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeScreenContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          MovieDataModel movie = Provider.of<ProviderClass>(context).getData();
          return Provider.of<ProviderClass>(context).movie_data == null
              ? Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "No Record Found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : _buildMovie(movie);
        });
  }

  Widget _buildMovie(MovieDataModel movie) {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 8.0,
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 6.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Hero(
                        tag: movie.poster,
                        child: Image.network(movie.poster,
                            fit: BoxFit.cover, width: 130.0, height: 160.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movie.title,
                            //'Circle Of Eight',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Genre: ${movie.genre}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black38),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: <Widget>[
                              Text(
                                movie.imdbRating,
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2429f9)),
                              ),
                              SizedBox(width: 20),
                              Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepOrange.withOpacity(0.1),
                                      offset: Offset(0.0, 5.0),
                                      blurRadius: 6.0,
                                    )
                                  ]),
                                  child: SmoothStarRating(
                                      allowHalfRating: true,
                                      onRated: (v) {},
                                      starCount: 5,
                                      rating: 4,
                                      size: 20.0,
                                      isReadOnly: true,
                                      color: Color(0xFFff6631),
                                      borderColor: Colors.grey,
                                      spacing: 5.0)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
