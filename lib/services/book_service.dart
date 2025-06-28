import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/book.dart';

class BookService {
  final _client = Supabase.instance.client;

  Future<void> addBook({
    required String title,
    required String author,
    required String status,
    required String userId,
  }) async {
    await _client.from('books').insert({
      'title': title,
      'author': author,
      'status': status,
      'user_id': userId,
    });
  }

  Future<List<Book>> getBooksForUser(String userId, {String? status}) async {
    print('BookService: Function called with status: $status');

    final baseQuery = _client.from('books');

    // 1. Ambil semua data terlebih dahulu
    final rawResponse = await baseQuery.select().eq('user_id', userId);

    print('BookService: Raw response before filtering: $rawResponse');

    // 2. Lakukan filter manual di client
    final filtered =
        (rawResponse as List).where((book) {
          if (status == null || status.isEmpty) return true;
          final bookStatus = book['status']?.toString().toLowerCase().trim();
          final desiredStatus = status.toLowerCase().trim();
          return bookStatus == desiredStatus;
        }).toList();

    print('BookService: Filtered books count: ${filtered.length}');

    // 3. Urutkan manual
    filtered.sort((a, b) => b['created_at'].compareTo(a['created_at']));

    return filtered.map((e) => Book.fromMap(e)).toList();
  }

  Future<void> deleteBook(String id) async {
    await _client.from('books').delete().eq('id', id);
  }

  Future<void> updateBook({
    required String id,
    required String title,
    required String author,
    required String status,
  }) async {
    await _client
        .from('books')
        .update({'title': title, 'author': author, 'status': status})
        .eq('id', id);
  }
}
