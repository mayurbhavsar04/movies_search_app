import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_search_app/model/movie_data_model.dart';

class ProviderClass extends ChangeNotifier {
  MovieDataModel movie_data = new MovieDataModel();

  bool isLOading = true;

  static const String baseUrl = 'http://www.omdbapi.com/?apikey=d32a9278&t=';

  Future<MovieDataModel> getMovieData(String title) async {
    try {
      final response = await http.get('${baseUrl}${title}');
      if (response.statusCode == 200) {
        final MovieDataModel movieList = movieDataModelFromJson(response.body);
        return movieList;
      } else {
        print("Erorrrr");

        return null;
      }
    } catch (e) {
      print("Erorrrr");
      print(e);
      return null;
    }
  }

  searchMovie(String title) async {
    movie_data = await getMovieData(title);
    setData(movie_data);
  }

  setData(MovieDataModel movieData) {
    movie_data = movieData;
    isLOading = false;
    notifyListeners();
  }

  MovieDataModel getData() {
    return movie_data;
  }
}
