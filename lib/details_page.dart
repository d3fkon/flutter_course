import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

import 'data.dart';

class DetailsPage extends StatefulWidget {
  final Movie movie;

  const DetailsPage({Key key, @required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Movie movie;
  final TextStyle authorStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
  final TextStyle reviewStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300);
  final TextStyle headingStyle =
      TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w400,);

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: movie.imgUrl,
            child: Image.network(
              movie.imgUrl,
              height: screenSize.height,
              width: screenSize.width,
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: prefix0.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          ListView(
            children: <Widget>[
              _buildTitle(),
              _buildDescription(),
              _buildReviews()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildWithBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildWithBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'Description',
                style: headingStyle,
              ),
              Text(
                movie.description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviews() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildWithBackground(
        child: Column(
          children: <Widget>[
            Text(
              'Reviews',
              style: headingStyle,
            ),
            ...movie.reviews.map((review) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                review.review,
                                style: reviewStyle,
                              ),
                              Text(
                                review.author,
                                style: authorStyle,
                              )
                            ].toList()),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildWithBackground({@required Widget child}) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.5)),
        child: child,
      );
}
