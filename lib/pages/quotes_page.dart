import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/quote.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late Future<List<Quote>> quotes;
  String selectedCategory = 'happiness';
  final List<String> categories = [
    'age',
    'alone',
    'amazing',
    'anger',
    'architecture',
    'art',
    'attitude',
    'beauty',
    'best',
    'birthday',
    'business',
    'car',
    'change',
    'communication',
    'computers',
    'cool',
    'courage',
    'dad',
    'dating',
    'death',
    'design',
    'dreams',
    'education',
    'environmental',
    'equality',
    'experience',
    'failure',
    'faith',
    'family',
    'famous',
    'fear',
    'fitness',
    'food',
    'forgiveness',
    'freedom',
    'friendship',
    'funny',
    'future',
    'god',
    'good',
    'government',
    'graduation',
    'great',
    'happiness',
    'health',
    'history',
    'home',
    'hope',
    'humor',
    'imagination',
    'inspirational',
    'intelligence',
    'jealousy',
    'knowledge',
    'leadership',
    'learning',
    'legal',
    'life',
    'love',
    'marriage',
    'medical',
    'men',
    'mom',
    'money',
    'morning',
    'movies',
    'success'
  ];

  @override
  void initState() {
    super.initState();
    quotes = ApiService.fetchQuotes(selectedCategory);
  }

  void _onCategoryChanged(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        selectedCategory = newCategory;
      });
    }
  }

  void _fetchQuotes() {
    setState(() {
      quotes = ApiService.fetchQuotes(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Quotes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: _onCategoryChanged,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), 
                      labelText: 'Select Category',
                    ),
                    items: categories
                        .map<DropdownMenuItem<String>>((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _fetchQuotes,
                    child: Text('See'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Quote>>(
              future: quotes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final quote = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.blueAccent.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                quote.text,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '- ${quote.author}',
                                style: TextStyle(
                                    fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No quotes found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
