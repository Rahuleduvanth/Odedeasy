import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category Page")),
      body: const Center(
        child: Text("Products in this category would be shown here."),
      ),
    );
  }
}