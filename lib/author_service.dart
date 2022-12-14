import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart';

class Author {
  final String id;
  final String name;
  final String slug;

  const Author({
    required this.id,
    required this.name,
    required this.slug,
  });
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(id: json['_id'], name: json['name'], slug: json['slug']);
  }
}

class AuthorService {
  final apiUrl = EnvironmentConfig.AUTHORS_DB_BASE_URL;
  Future<List<Author>> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((result) => Author.fromJson(result)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
