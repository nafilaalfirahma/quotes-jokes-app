import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/joke.dart';

class JokesScreen extends StatefulWidget {
  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  late Future<Joke> joke;

  @override
  void initState() {
    super.initState();
    joke = ApiService.fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: FutureBuilder<Joke>(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  snapshot.data!.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            return Center(child: Text('No jokes found'));
          }
        },
      ),
    );
  }
}
