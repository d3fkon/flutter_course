typedef AddReviewCallback = void Function(Movie movie, Review review);

class Movie {
  final String imgUrl, title, brief, description, genre;
  final List<Review> reviews;

  Movie(
      {this.genre,
      this.imgUrl,
      this.title,
      this.brief,
      this.description,
      this.reviews});
}

class Review {
  final String review, author;

  Review({this.review, this.author});
}

class MovieDataProvider {
  List<Review> _sampleReviews = [
    Review(review: "Great Movie, Must watch", author: "Alpha MOG"),
    Review(
        review:
            "Greate Movie, Could use improvements, However, the pilot was the best",
        author: "Beta MOG")
  ];
  List<Movie> movieData;

  MovieDataProvider() {
    movieData = [
      Movie(
          imgUrl:
              "https://images-na.ssl-images-amazon.com/images/I/71rNJQ2g-EL._SY606_.jpg",
          title: "Moonlight",
          reviews: [..._sampleReviews],
          brief:
              "Movie Alpha talks about how alpha romeo won over the internet",
          description:
              "LLorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet orem Ipsum Dolor Set Amet ",
          genre: "Drama"),
      Movie(
          imgUrl:
              "https://images-na.ssl-images-amazon.com/images/I/519xOk%2BVYDL._SY741_.jpg",
          title: "Alladin",
          reviews: [..._sampleReviews],
          brief:
              "Movie Bravo is Beautiful representation of the talks about how alpha romeo won over the internet",
          description:
              "LLorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet orem Ipsum Dolor Set Amet ",
          genre: "Rom Com"),
      Movie(
          imgUrl:
              "https://static01.nyt.com/images/2017/09/15/arts/24movie-posters8/24movie-posters8-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
          title: "The Shining",
          reviews: [..._sampleReviews],
          brief:
              "Movie Charlie is the holy representation of how alpha romeo won over the internet",
          description:
              "LLorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet orem Ipsum Dolor Set Amet ",
          genre: "Suspense"),
      Movie(
          title: "Star Wars",
          imgUrl:
              "https://d13ezvd6yrslxm.cloudfront.net/wp/wp-content/images/2017-bestposter-starwarslastjedi.jpg",
          reviews: [..._sampleReviews],
          brief:
              "Movie Delta RomComs about how alpha romeo won over the internet",
          description:
              "LLorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet Lorem Ipsum Dolor Set Amet orem Ipsum Dolor Set Amet ",
          genre: "Thriller"),
    ];
  }

  void addReview(Movie movie, Review review) {
    int index = movieData.indexOf(movie);
    movieData[index].reviews.add(review);
  }
}
