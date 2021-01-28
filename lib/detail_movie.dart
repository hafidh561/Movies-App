import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission/model/movie.dart';

class DetailMovie extends StatelessWidget {
  final Movie movie;
  DetailMovie({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          width: 50,
          height: 50,
          child: FittedBox(
            child: FloatingActionButton(
              child: FavoriteButton(),
              onPressed: null,
            ),
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    movie.poster,
                    height: 500,
                    width: 500,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (movie.title.length < 17 ? 350 : 290), left: 20),
                  child: Text(movie.title,
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 417, left: 20),
                  child: Text(
                      movie.year +
                          " • " +
                          movie.duration +
                          " • " +
                          movie.released,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 450, left: 20),
                    child: Row(
                        children: movie.genreAndRated.map((genreAndRated) {
                      return Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            genreAndRated,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ));
                    }).toList()))
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: movie.ratings.map((rating) {
                      return Column(
                        children: <Widget>[
                          Text(rating[1],
                              style: GoogleFonts.getFont('Source Sans Pro',
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                          Text(rating[0],
                              style: GoogleFonts.getFont('Source Sans Pro',
                                  textStyle: TextStyle(fontSize: 20)))
                        ],
                      );
                    }).toList())),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(movie.awards,
                        style: GoogleFonts.getFont('Source Sans Pro',
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)))
                  ]),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                        color: Colors.black38,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        height: 40))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15, left: 20),
              child: Text(
                "Synopsis",
                style: GoogleFonts.getFont("Roboto",
                    textStyle: TextStyle(fontSize: 25)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Flexible(
                  child: Text(
                movie.synopsis,
                style: GoogleFonts.getFont("Roboto",
                    textStyle: TextStyle(
                        fontSize: 15, height: 1.4, color: Colors.white70)),
              )),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Divider(
                        color: Colors.black38,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        height: 40))
              ],
            ),
            // Movie Info
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Movie Info",
                  style: GoogleFonts.getFont("Roboto",
                      textStyle: TextStyle(fontSize: 25)),
                )),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Director:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.director,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text("Writer:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.writer,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text("Actors:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.actors,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text("Production:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.production,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text("Box Office:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.boxOffice,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text("Country:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.country,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text("Language:",
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold))),
                    Text(movie.language,
                        style: GoogleFonts.getFont("Roboto",
                            textStyle: TextStyle(
                                fontSize: 20, color: Colors.white70))),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                  ],
                )),
            Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Home", style: TextStyle(fontSize: 15)),
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
            )
          ],
        )));
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.black87),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}
