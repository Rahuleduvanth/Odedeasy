import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage("https://placehold.co/600x400"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text("Product Name Goes Here", style: textTheme.headlineLarge?.copyWith(fontSize: 32)),
            const SizedBox(height: 12),
            Text(
              "\$99.99",
              style: textTheme.headlineMedium?.copyWith(color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 24),
            Text(
              "About this item",
              style: textTheme.headlineMedium?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Text(
              "This is a detailed description of the product. It's a high-quality item perfect for your needs. It has been gently used and is in excellent condition. All parts are included as shown in the pictures.",
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/chats'),
                child: const Text("Chat with Seller"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}