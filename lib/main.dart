import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/users/provider/user_provider.dart';
import 'features/users/screens/user_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users CRUD App',
        theme: ThemeData(
          useMaterial3: true,

          // Primary app colors
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4F46E5), // Indigo
            brightness: Brightness.light,
          ),

          // Background color
          scaffoldBackgroundColor: const Color(0xFFF8FAFC),

          // App bar styling
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          ),

          // Card styling
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 3,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          // Input field styling
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF4F46E5),
                width: 1.5,
              ),
            ),
          ),

          // Button styling
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Floating Action Button styling
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF4F46E5),
            foregroundColor: Colors.white,
          ),
        ),

        // Main screen
        home: const UserListScreen(),
      ),
    );
  }
} 