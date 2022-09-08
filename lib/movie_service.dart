import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart';

class Movie {
  final String posterPath;
  final int id;
  final String title;

  const Movie({
    required this.posterPath,
    required this.id,
    required this.title,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class MovieService {
  final apiKey = EnvironmentConfig.MOVIE_DB_API_KEY;
  final apiUrl = EnvironmentConfig.MOVIE_DB_BASE_URL;
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
        Uri.parse('$apiUrl/popular/?api_key=$apiKey&language=en-US&page=1/'));

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)["results"];
      return results.map((result) => Movie.fromJson(result)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
