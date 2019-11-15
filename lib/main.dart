import 'package:flutter/material.dart';
import 'package:vlec2/details_page.dart';

import 'data.dart';

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
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  static String imgUrl =
      'https://bloximages.newyork1.vip.townnews.com/westcentralsbest.com/content/tncms/assets/v3/editorial/0/eb/0eb79b58-fcf3-11e5-8531-7f6042fc123e/5706ae94ebd55.image.jpg?resize=1200%2C750';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          Movie movie = movieData[i];
          return GestureDetector(
            onTap: () {
              // TODO: Navigate to detailsPage
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DetailsPage(movie: movieData[i],)));
            },
            child: MovieCard(
              imgUrl: movie.imgUrl,
              title: movie.title,
              genre: movie.genre,
              brief: movie.brief,
            ),
          );
        },
        itemCount: movieData.length,
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title, genre, brief, imgUrl;

  const MovieCard(
      {Key key,
      @required this.imgUrl,
      @required this.title,
      @required this.genre,
      @required this.brief})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        height: screenSize.height / 4,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: <Widget>[
              Hero(
                tag: imgUrl,
                child: Image.network(imgUrl,
                    width: screenSize.width / 2.7,
                    height: screenSize.height / 4,
                    fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "$genre".toUpperCase(),
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w300),
                      ),
                      Text(
                          "dolor sit amet Loremdolor sit amet Loremlor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
