import 'package:flutter/material.dart';
import 'package:homework08/models/beauty.dart';

class DetailsScreen extends StatelessWidget {
  final Beauty item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(item.title ?? "Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (item.images != null && item.images!.isNotEmpty)
              Hero(
                tag: item.title ?? "tag_details",
                child: Image.network(
                  item.images![0],
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              )
            else
              const Icon(
                Icons.image_not_supported,
                size: 100,
                color: Colors.grey,
              ),
            // if (item.images != null && item.images!.isNotEmpty)
            //   Image.network(
            //     item.images![0],
            //     height: 300,
            //     width: double.infinity,
            //     fit: BoxFit.contain,
            //   )
            // else
            //   const Icon(
            //     Icons.image_not_supported,
            //     size: 100,
            //     color: Colors.grey,
            //   ),

            const SizedBox(height: 20),

            Text(
              item.title ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${item.price} SAR",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "⭐ ${item.rating}",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 22,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.description ?? "No description",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Warranty Information",
              style: TextStyle(
                fontSize: 22,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.warrantyInformation ?? "N/A",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "Shipping Information",
              style: TextStyle(
                fontSize: 22,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.shippingInformation ?? "N/A",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
