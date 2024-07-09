import 'package:streamflix/model/film_data_model.dart';
import 'package:streamflix/repository/streamflix_repository.dart';

import '../model/movie_collections_model.dart';
import '../model/the_night_agent_model.dart';

class StreamflixController{
  final streamflixrepo =streamflixRepo();

  Future<List<TheNightAgentModel>> getData() async{
    try{
      final streamflixmodel = await streamflixrepo.getNightAgentdata();
      print("streamflixmodel = $streamflixmodel");

      return streamflixmodel;
    } catch(e){
      print(e);
      rethrow;
    }
  }
  Future<FilmDataModel> fetchData() async{
    try{
      final streamflixfilmmodel = await streamflixrepo.getFilmData();
      print("streamflixfilmmodel = $streamflixfilmmodel");

      return streamflixfilmmodel;
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<MovieCollectionModel> getMovieCollection() async{
    try{
      final moviecollectionmodel = await streamflixrepo.getMovieCollection();
      print("moviecollectionnnn = $moviecollectionmodel");

      return moviecollectionmodel;
    }catch(e){
      print(e);
      rethrow;
    }

  }

}