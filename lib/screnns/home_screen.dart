import 'package:flutter/material.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de produtos mantida no estado
  final List<Product> _products = [
    Product(name: 'Maçã', price: 2.5),
    Product(name: 'Banana', price: 1.8),
    Product(name: 'Laranja', price: 3.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final item = _products[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: item,
              );
            },
          );
        },
      ),
      // Botão flutuante para adicionar produto
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Navega para a tela de adicionar e aguarda o resultado
          final result = await Navigator.pushNamed(context, '/add');
          if (result is Product) {
            setState(() {
              _products.add(result);
            });
          }
        },
      ),
    );
  }
}
