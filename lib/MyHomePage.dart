import 'package:flutter/material.dart';

import 'movie_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = MovieService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    const imageBaseUrl = "https://image.tmdb.org/t/p/w500/";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
      ),
      body: FutureBuilder<List<Movie>>(
          future: futureMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(snapshot.data!.length, (index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          imageBaseUrl + snapshot.data![index].posterPath,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data![index].title,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
