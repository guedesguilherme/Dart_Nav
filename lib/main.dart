import 'package:flutter/material.dart';
import 'models/product.dart';
import './screnns/home_screen.dart';
import './screnns/product_detail_screen.dart';
import './screnns/add_product_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Produtos',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const ProductDetailScreen(),
        '/detail': (context) => const ProductDetailScreen(),
        '/add':    (context) => const AddProductScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: args),
          );
        }
        // onGenerate para /add não é necessário, pois não recebe args
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
