class TheNightAgentModel {
  String? sId;
  String? seriesName;
  String? releaseYear;
  String? numberofSeasons;
  String? description;
  String? creator;
  List<String>? starring;
  List<Episodes>? episodes;
  int? iV;

  TheNightAgentModel(
      {this.sId,
        this.seriesName,
        this.releaseYear,
        this.numberofSeasons,
        this.description,
        this.creator,
        this.starring,
        this.episodes,
        this.iV});

  TheNightAgentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    seriesName = json['seriesName'];
    releaseYear = json['releaseYear'];
    numberofSeasons = json['numberofSeasons'];
    description = json['description'];
    creator = json['creator'];
    starring = json['starring'].cast<String>();
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['seriesName'] = this.seriesName;
    data['releaseYear'] = this.releaseYear;
    data['numberofSeasons'] = this.numberofSeasons;
    data['description'] = this.description;
    data['creator'] = this.creator;
    data['starring'] = this.starring;
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Episodes {
  int? episodeNum;
  String? episodeName;
  String? episodeDescription;
  String? episodeDuration;
  String? sId;

  Episodes(
      {this.episodeNum,
        this.episodeName,
        this.episodeDescription,
        this.episodeDuration,
        this.sId});

  Episodes.fromJson(Map<String, dynamic> json) {
    episodeNum = json['episodeNum'];
    episodeName = json['episodeName'];
    episodeDescription = json['episodeDescription'];
    episodeDuration = json['episodeDuration'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['episodeNum'] = this.episodeNum;
    data['episodeName'] = this.episodeName;
    data['episodeDescription'] = this.episodeDescription;
    data['episodeDuration'] = this.episodeDuration;
    data['_id'] = this.sId;
    return data;
  }
}