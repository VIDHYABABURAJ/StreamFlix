

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:streamflix/model/film_data_model.dart';

import '../model/movie_collections_model.dart';
import '../model/the_night_agent_model.dart';

class streamflixRepo{
  Future<List<TheNightAgentModel>> getNightAgentdata()async {

    http.Response res = await http.get(Uri.parse('http://10.0.2.2:8989/api/series/view'));
    print(res);
    if(res.statusCode == 200){
      var data= jsonDecode(res.body);
      print("My data =$data");
      List<TheNightAgentModel> seriesdata = data['data'].map<TheNightAgentModel>((e)=> TheNightAgentModel.fromJson(e)).toList();
      print("seriesdataaaa : $seriesdata");
      return seriesdata;
    }else{
      throw res;
    }
  }
  Future<FilmDataModel> getFilmData() async {

    http.Response res = await http.get(Uri.parse("http://10.0.2.2:8989/api/film/view"));
    print('cvvvvcvcv');

    if(res.statusCode == 200){
      var data= jsonDecode(res.body);
      print("filmdata = $data");
   FilmDataModel  filmdata =FilmDataModel.fromJson(data);
      print("filmdataaa: $filmdata");
      return filmdata;
    }else{
      throw res;
    }
  }

  Future<MovieCollectionModel> getMovieCollection() async {
    http.Response res = await http.get (Uri.parse("http://10.0.2.2:8989/api/filmposter/view"));
    print("movie Collection");

    print("result =${res.statusCode}");

    if(res.statusCode == 201){
      var data = jsonDecode(res.body);
      print("movieModel = $data");
      MovieCollectionModel movieCollection = MovieCollectionModel.fromJson(data);
      print("collection = $movieCollection");
      return movieCollection;
    }else{
      throw res;
    }
  }


}