import 'package:flutter/material.dart';

import 'author_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Author>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = AuthorService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Author App"),
      ),
      body: FutureBuilder<List<Author>>(
          future: futureMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 4,
                children: List.generate(snapshot.data!.length, (index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          "https://images.quotable.dev/profile/400/${snapshot.data![index].slug}.jpg",
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data![index].name,
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
