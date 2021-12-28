import 'package:flutter/material.dart';

import '../model/movies.dart';

class MovieListView extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListView> {
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Arrow",
    "The Flash",
    "Spiderman",
    "Superman",
    "Batman",
    "Avengers",
    "Ironman",
    "Warcraft",
    "Blackwidow",
    "One Piece",
    "Naruto",
    "Hunter X Hunter",
    "Fairy Tail",
    "Boruto",
    "Black Clover",
    "Invincible",
    "Shangchi",
    "Silicon Valley",
    "Hitman",
    "Red Notice",
    "Hawkeye",
    "World Trigger",
    "Vikings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return movieCard(movieList[index], context);
            //  Card(
            //   color: Colors.white,
            //   elevation: 4.2,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(movieList[index].images[0]),
            //             fit: BoxFit.cover,
            //           ),
            //           // color: Colors.blue,
            //           borderRadius: BorderRadius.circular(14),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     //onTap: () => print("Movie Name: ${movies[index]}"),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => MovieDetail(
            //                 movieList[index].title, movieList[index])),
            //       );
            //     },
            //     title: Text(movieList[index].title),
            //     subtitle: Text(movieList[index].rated),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(movie.title),
                    Text("Rating: ${movie.imdbRating}/10"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Released: ${movie.released}"),
                    Text(movie.runtime),
                    Text(movie.rated)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetail(movie.title, movie)));
      },
    );
  }
}

class MovieDetail extends StatelessWidget {
  final String movieName;
  final Movie movie;

  MovieDetail(this.movieName, this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Name: $movieName"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back ${this.movie.plot}"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
