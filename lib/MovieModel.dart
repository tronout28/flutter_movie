class MovieModel {
  bool? success;
  String? message;
  List<Data>? data;

  MovieModel({this.success, this.message, this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? genre;
  String? release;

  String? sinopsis;
  String? poster;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.genre,
        this.release,
        this.sinopsis,
        this.poster,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    genre = json['genre'];
    release = json['release'];
    sinopsis = json['sinopsis'];
    poster = json['poster'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['genre'] = this.genre;
    data['release'] = this.release;

    data['sinopsis'] = this.sinopsis;
    data['poster'] = this.poster;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
