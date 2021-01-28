import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission/detail_movie.dart';
import 'package:submission/data.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
            icon: Icon(
              Icons.arrow_upward,
              size: 40,
            ),
            onPressed: () {
              _scrollController.animateTo(0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            }),
        body: ListView(
          controller: _scrollController,
          padding: EdgeInsets.only(left: 30, right: 30),
          children: <Widget>[
            // Search Bar
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text("Movies App",
                          style: GoogleFonts.getFont("Source Sans Pro",
                              textStyle: TextStyle(fontSize: 50))))
                ]),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            // List Movie
            Column(
              children: movies.map((movie) {
                return FlatButton(
                  padding: EdgeInsets.only(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailMovie(movie: movie);
                    }));
                  },
                  child: Stack(
                    children: <Widget>[
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          movie.poster,
                          fit: BoxFit.cover,
                          height: 450,
                          width: 450,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: (movie.title.length > 21) ? 350 : 380,
                              left: 15),
                          child: (movie.title.length > 21)
                              ? Container(
                                  width: 290,
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                              offset: Offset(1.5, -1.5),
                                              color: Colors.black)
                                        ],
                                        fontSize: 30),
                                  ),
                                )
                              : Text(
                                  movie.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            offset: Offset(1.5, -1.5),
                                            color: Colors.black)
                                      ],
                                      fontSize: 30),
                                )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: (movie.title.length > 21) ? 425 : 415,
                            left: 15),
                        child: Text(movie.year,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
