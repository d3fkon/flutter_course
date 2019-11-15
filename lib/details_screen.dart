import 'dart:ui';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;

import 'data.dart';

class MovieScreen extends StatefulWidget {
  final Movie movieDetails;

  MovieScreen({@required this.movieDetails});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Movie movie;

  @override
  initState() {
    super.initState();
    movie = widget.movieDetails;
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
            filter: prefix0.ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${movie.title}',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.description,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: prefix0.TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Reviews",
                            style: prefix1.TextStyle(color: Colors.white),
                          ),
                        ),
                        ...movie.reviews.map((review) {
                          return _buildReviewBox(review);
                        }).toList(),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildReviewBox(Review review) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  review.review,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18
                  ),
                ),
                Text(
                  review.author,
                  style: prefix1.TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
