import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';
import '../models/joke.dart';

class ApiService {
  static const String _apiKey = 'xQwTQVVKPrKIbrHRsu4ynw==viZG6wzkk4UnN0uv';
  static const String baseQuotesUrl =
      'https://api.api-ninjas.com/v1/quotes?category=';
  static const jokesUrl = 'https://jokesbapak2.reinaldyrafli.com/api/';

  static Future<List<Quote>> fetchQuotes(String category) async {
    final response =
        await http.get(Uri.parse('$baseQuotesUrl$category&key=$_apiKey'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((quote) => Quote.fromJson(quote)).toList();
    } else {
      print('Failed to load quotes: ${response.reasonPhrase}'); // Log the error
      throw Exception('Failed to load quotes');
    }
  }

  static Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(jokesUrl));
    if (response.statusCode == 200) {
      return Joke.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
