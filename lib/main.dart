import 'package:flutter/material.dart';
import 'screens/add_product_screen.dart';
import 'screens/category_screen.dart';
import 'screens/chats_list_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/my_listings_screen.dart';
import 'screens/order_details_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFF7F7C1);

    return MaterialApp(
      title: 'EcoFinds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: accentColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Grandstander', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 48),
          headlineMedium: TextStyle(fontFamily: 'Grandstander', fontWeight: FontWeight.w600, color: Colors.white, fontSize: 28),
          bodyMedium: TextStyle(fontFamily: 'Sen', color: Colors.white, fontSize: 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C1C1E),
          hintStyle: TextStyle(color: Colors.grey.shade600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontFamily: 'Sen', fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/product_detail': (context) => const ProductDetailScreen(),
        '/category': (context) => const CategoryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/chats': (context) => const ChatsListScreen(),
        '/add_product': (context) => const AddProductScreen(),
        '/my_listings': (context) => const MyListingsScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/order_details': (context) => const OrderDetailsScreen(),
      },
    );
  }
}