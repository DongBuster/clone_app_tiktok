// import 'package:clone_app_tiktok/BuildApp/MyApp.dart';
import 'package:clone_app_tiktok/provider/GlobalState.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'BuildApp/MyApp.dart';
import 'firebase_options.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://pxyrpotnfzpgnuzvssfp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4eXJwb3RuZnpwZ251enZzc2ZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk0NDY3MDMsImV4cCI6MjAyNTAyMjcwM30.j93m9Xsl1HBb9UPJ0pVhgXR7BT8N8a63Qg4XOSa78_w',
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: const SafeArea(child: MyApp()),
    ),
  );
}
