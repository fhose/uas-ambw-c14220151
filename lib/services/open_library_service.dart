import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenLibraryService {
  Future<List<BookSearchResult>> searchBooks(String query) async {
    final url = Uri.parse('https://openlibrary.org/search.json?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List docs = json['docs'];

      return docs
          .where((doc) => doc['title'] != null && doc['author_name'] != null)
          .map<BookSearchResult>((doc) => BookSearchResult(
                title: doc['title'],
                author: (doc['author_name'] as List).join(', '),
              ))
          .toList();
    } else {
      throw Exception('Gagal mengambil data dari Open Library');
    }
  }
}

class BookSearchResult {
  final String title;
  final String author;

  BookSearchResult({required this.title, required this.author});
}
