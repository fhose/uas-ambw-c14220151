import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hppmctqqyjslnjxjqmci.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhwcG1jdHFxeWpzbG5qeGpxbWNpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA4NzYyMzQsImV4cCI6MjA2NjQ1MjIzNH0.rQcU-Ik__MIFQfgvvhp2kSng8l-Vi-uV7uRDOQM98cA', // Ganti dengan anon/public API key
  );

  runApp(const MyApp());
}
