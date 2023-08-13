import 'package:flutter/material.dart';
import 'package:mv/MovieModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

MovieModel? movieModel;
bool isLoaded = true;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovieApi();
  }

  void fetchMovieApi() async{
    setState(() {
      isLoaded = false;
    });

    final getApi = await http.get(
      Uri.parse(
          'https://movieonetake.000webhostapp.com/movie/json'),
    );
    movieModel = MovieModel.fromJson(
      json.decode(
        getApi.body.toString(),

      ),
    );
    print(getApi.body.toString());
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Movie Anime',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: isLoaded == false
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(
            itemCount: movieModel!.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                movieModel!
                                    .data![index].poster!,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieModel!.data![index].title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              movieModel!
                                  .data![index].genre!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              movieModel!
                                  .data![index].release!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}



