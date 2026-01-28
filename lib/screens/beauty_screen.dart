import 'package:homework08/service/api.dart';
import 'package:flutter/material.dart';
import 'package:homework08/screens/details_screen.dart';

class BeautyScreen extends StatelessWidget {
  const BeautyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sephora"),
        titleTextStyle: TextStyle(color: Colors.white),
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
                  // 2. تمرير الـ item إلى شاشة التفاصيل
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // هنا نضع الـ item الذي عرفناه فوق داخل DetailsScreen
                      builder: (context) => DetailsScreen(item: item),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(8),
                  color: const Color.fromARGB(255, 84, 83, 83),
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].images![0]),
                      SizedBox(height: 8),
                      Text(
                        snapshot.data![index].title ?? "",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        snapshot.data![index].price.toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Text(
                        snapshot.data![index].rating.toString(),
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
