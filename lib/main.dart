import 'package:flutter/material.dart';
import 'data.dart';
import 'details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: ListView.builder(itemBuilder: (context, i) {
        Movie movie = movieData[i];
        return MovieCard(
          movie: movie,
        );
      }, itemCount: movieData.length,),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard({@required this.movie});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MovieScreen(movieDetails: movie,))
          );
        },
        child: Container(
          height: screenSize.height / 4,
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: movie.imgUrl,
                  child: Image.network(
                    movie.imgUrl,
                    fit: BoxFit.cover,
                    width: screenSize.width / 2.5,
                    height: screenSize.height / 4,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${movie.title}',
                          style:
                              TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${movie.genre}',
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        Text('${movie.brief}'),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
