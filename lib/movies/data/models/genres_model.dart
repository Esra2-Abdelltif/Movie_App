import 'package:movies_and_tv_app/movies/domian/entites/genres.dart';

class GenresModel extends Genres {
  GenresModel({required int id, required String name})
      : super(id: id, name: name);

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
