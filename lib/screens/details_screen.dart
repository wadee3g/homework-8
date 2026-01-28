
import 'package:flutter/material.dart';
import 'package:homework08/models/beauty.dart';

class DetailsScreen extends StatelessWidget {
  final Beauty item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title ?? "التفاصيل"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            _buildSectionTitle("Description"),
            Text(
              item.description ?? "No description available",
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const Divider(height: 30),


            _buildSectionTitle("Warranty & Shipping"),
            _buildInfoRow(Icons.verified_user, "Warranty", item.warrantyInformation),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.local_shipping, "Shipping", item.shippingInformation),
            const Divider(height: 30),

            
            if (item.reviews != null && item.reviews!.isNotEmpty) ...[
              _buildSectionTitle("Reviews (${item.reviews!.length})"),

              ...item.reviews!.map((review) {
                
                if (review is Map) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const Icon(Icons.comment, color: Colors.orangeAccent),
                      title: Text(review['comment'] ?? ""),
                      subtitle: Text("Rating: ${review['rating']} ⭐"),
                      trailing: Text(review['reviewerName'] ?? "", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }

  
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }


  Widget _buildInfoRow(IconData icon, String label, String? value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700], size: 20),
        const SizedBox(width: 8),
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Expanded(child: Text(
            value ?? "N/A",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}