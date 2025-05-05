import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de nome
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Digite um nome' : null,
                onSaved: (value) => _name = value!.trim(),
              ),
              const SizedBox(height: 16),
              // Campo de preço
              TextFormField(
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Digite um preço';
                  final parsed = double.tryParse(value);
                  if (parsed == null) return 'Preço inválido';
                  return null;
                },
                onSaved: (value) =>
                    _price = double.parse(value!.replaceAll(',', '.')),
              ),
              const SizedBox(height: 24),
              // Botão de salvar
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Cria o produto e retorna via pop
                    final newProduct = Product(name: _name, price: _price);
                    Navigator.pop(context, newProduct);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
