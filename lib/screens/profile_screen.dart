import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 60, backgroundColor: Color(0xFF1C1C1E)),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("USER NAME", style: textTheme.headlineMedium),
                    const SizedBox(height: 5),
                    Text("EMAIL@EXAMPLE.COM", style: textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildProfileOption(context, 'My Listings', Icons.list_alt_outlined, () => Navigator.pushNamed(context, '/my_listings')),
            _buildProfileOption(context, 'Saved Products', Icons.favorite_border, () => Navigator.pushNamed(context, '/favorites')),
            _buildProfileOption(context, 'Order History', Icons.history, () => Navigator.pushNamed(context, '/order_details')),
            _buildProfileOption(context, 'Settings', Icons.settings_outlined, () => Navigator.pushNamed(context, '/settings')),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: const Text("Log Out", style: TextStyle(color: Colors.redAccent, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 28),
      title: Text(title, style: const TextStyle(fontSize: 18, fontFamily: 'Sen')),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}