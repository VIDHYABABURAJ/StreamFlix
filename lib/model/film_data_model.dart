class FilmDataModel {
  bool? success;
  bool? error;
  List<Data>? data;
  String? message;

  FilmDataModel({this.success, this.error, this.data, this.message});

  FilmDataModel.fromJson(Map<String, dynamic> json) {
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
  String? filmName;
  String? releaseYear;
  String? duration;
  String? description;
  String? creator;
  List<String>? starring;
  String? image;
  int? iV;

  Data(
      {this.sId,
        this.filmName,
        this.releaseYear,
        this.duration,
        this.description,
        this.creator,
        this.starring,
        this.image,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    filmName = json['filmName'];
    releaseYear = json['releaseYear'];
    duration = json['duration'];
    description = json['description'];
    creator = json['creator'];
    starring = json['starring'].cast<String>();
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['filmName'] = this.filmName;
    data['releaseYear'] = this.releaseYear;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['creator'] = this.creator;
    data['starring'] = this.starring;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}