import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("Order Summary", style: textTheme.headlineMedium),
            const SizedBox(width: 10),
            Text("#256894", style: textTheme.headlineMedium?.copyWith(color: Colors.grey)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildItemsSummaryCard(context),
            const SizedBox(height: 24),
            _buildOrderTotalsCard(context),
            const SizedBox(height: 24),
            _buildDeliveryAddressCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsSummaryCard(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DataTable(
          headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          dataTextStyle: const TextStyle(color: Colors.black87, fontSize: 16),
          columnSpacing: 30,
          columns: const [
            DataColumn(label: Text('Items Summary')),
            DataColumn(label: Text('QTY'), numeric: true),
            DataColumn(label: Text('Price'), numeric: true),
            DataColumn(label: Text('Total Price'), numeric: true),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('Chocolate Frappe')),
              DataCell(Text('x1')),
              DataCell(Text('90.00')),
              DataCell(Text('90.00')),
            ]),
            DataRow(cells: [
              DataCell(Text('Sprite')),
              DataCell(Text('x1')),
              DataCell(Text('70.00')),
              DataCell(Text('70.00')),
            ]),
            DataRow(cells: [
              DataCell(Text('Coco cola')),
              DataCell(Text('x2')),
              DataCell(Text('75.00')),
              DataCell(Text('150.00')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTotalsCard(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order Created', style: TextStyle(color: Colors.black, fontSize: 18)),
                Text('Sun, 7 May, 2025', style: TextStyle(color: Colors.grey.shade700, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal', style: TextStyle(color: Colors.black, fontSize: 18)),
                Text('310.00', style: TextStyle(color: Colors.grey.shade700, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Delivery Fee', style: TextStyle(color: Colors.black, fontSize: 18)),
                Text('0.00', style: TextStyle(color: Colors.grey.shade700, fontSize: 18)),
              ],
            ),
            const Divider(height: 24, color: Colors.black12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Fee', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('310.00', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddressCard(BuildContext context) {
     return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const SizedBox(
        width: double.infinity,
        height: 150,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Delivery Address', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}