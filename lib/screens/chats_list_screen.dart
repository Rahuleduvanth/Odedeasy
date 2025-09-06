import 'package:flutter/material.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  String _selectedFilter = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats", style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: [
                _buildFilterChip('ALL'),
                const SizedBox(width: 10),
                _buildFilterChip('Buying'),
                const SizedBox(width: 10),
                _buildFilterChip('Selling'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      'Name ${index + 1}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'Message.....',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final bool isSelected = _selectedFilter == label;
    return ActionChip(
      label: Text(label),
      labelStyle: TextStyle(
        color: isSelected ? Colors.black : Colors.white,
        fontFamily: 'Sen',
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: isSelected ? Theme.of(context).primaryColor : const Color(0xFF1C1C1E),
      onPressed: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}