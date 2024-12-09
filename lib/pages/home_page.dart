import 'package:flutter/material.dart';
import 'quotes_page.dart';
import 'jokes_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Fun App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotesScreen()),
                );
              },
              child: Text('Get Random Quotes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JokesScreen()),
                );
              },
              child: Text('Get Random Jokes'),
            ),
          ],
        ),
      ),
    );
  }
}
