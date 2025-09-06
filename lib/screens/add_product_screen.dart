import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selling", style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload_file, color: Colors.white70),
              label: const Text("Upload Image", style: TextStyle(color: Colors.white70, fontSize: 18)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                side: const BorderSide(color: Color(0xFF1C1C1E)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(hintText: 'Enter Product Title...')),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(hintText: 'Enter Product Price...'), keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(hintText: 'Enter Location...')),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(hintText: 'Enter Category...')),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(hintText: 'Enter Product Description...'),
              maxLines: 5,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}