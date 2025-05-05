import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product? product;

  // Construtor com parâmetro opcional, para compatibilidade de rotas
  const ProductDetailScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    // Se product for null (por segurança), tenta extrair dos argumentos
    final prod = product ?? ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(prod.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              prod.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Preço: R\$ ${prod.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
