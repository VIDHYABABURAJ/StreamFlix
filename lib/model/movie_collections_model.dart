class MovieCollectionModel {
  bool? success;
  bool? error;
  List<Data>? data;
  String? message;

  MovieCollectionModel({this.success, this.error, this.data, this.message});

  MovieCollectionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? filmId;
  String? filmName;
  String? image;
  int? iV;

  Data({this.sId, this.filmId, this.filmName, this.image, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filmId = json['filmId'];
    filmName = json['filmName'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['filmId'] = this.filmId;
    data['filmName'] = this.filmName;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}