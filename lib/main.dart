import 'package:flutter/material.dart';

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
      body: ListView.builder(itemBuilder: (BuildContext context, int i) {
        if(i == 2) {
          return Text("THIRD ELEMENT", style: TextStyle(fontSize: 40),);
        }
        String title = "Breaking Bad $i";
        String genre = "Genre $i";
        return MovieCard(title: title, genre: genre,);
      }, itemCount: 1000,),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title, genre;

  const MovieCard({Key key, @required this.title, @required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: <Widget>[
            Image.network(
              HomePage.imgUrl,
              width: screenSize.width / 2.7,
              height: screenSize.height / 4,
              fit: BoxFit.cover
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("$title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    Text("$genre".toUpperCase(), style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),),
                    SizedBox(height: 10,),
                    Text("dolor sit amet Loremdolor sit amet Loremlor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.amber,),
                        Icon(Icons.star, color: Colors.amber,),
                        Icon(Icons.star, color: Colors.amber,),
                        Icon(Icons.star_half, color: Colors.amber,),
                        Icon(Icons.star_border, color: Colors.amber,)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
