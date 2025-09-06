import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text('EcoFinds', style: TextStyle(fontFamily: 'Grand Hotel', fontSize: 32)),
        centerTitle: false,
        flexibleSpace: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 120, right: 120),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Products...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.zero,
                  fillColor: const Color(0xFF1C1C1E),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.person_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text('Featured Ad Here', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 30),
            Text('Browse by Categories', style: textTheme.headlineMedium),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/category'),
                  child: const CircleAvatar(radius: 50, backgroundColor: Color(0xFF1C1C1E)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text('Products to Buy', style: textTheme.headlineMedium),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/product_detail'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(context, '/chats');
              break;
            case 2:
              Navigator.pushNamed(context, '/add_product');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Sell'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}