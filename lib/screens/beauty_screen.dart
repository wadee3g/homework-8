import 'package:homework08/service/api.dart';
import 'package:flutter/material.dart';
import 'package:homework08/screens/details_screen.dart';

class BeautyScreen extends StatelessWidget {
  const BeautyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Sephora"),
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Api().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(item: item),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: item.title ?? "tag_${index}",
                        child: Image.network(item.images![0]),
                      ),
                      // Image.network(snapshot.data![index].images![0]),
                      // SizedBox(height: 8),
                      Text(
                        snapshot.data![index].title ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        "${snapshot.data![index].price.toString()} SAR",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Text(
                        "⭐ ${snapshot.data![index].rating.toString()}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
