import 'package:homework08/service/api.dart';
import 'package:flutter/material.dart';


class BeautyScreen extends StatelessWidget {
  const BeautyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: FutureBuilder(
        future: Api().getData(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(8),
                color: const Color.fromARGB(255, 84, 83, 83),
                child: Column(
                  children: [
                    Image.network(snapshot.data![index].images![0]),
                    SizedBox(height: 8),
                    Text(
                      snapshot.data![index].title ?? "",
                      style: TextStyle(fontSize: 22, color: Colors.deepOrange),
                    ),
                    Text(
                      snapshot.data![index].price.toString()!,
                      style: TextStyle(fontSize: 22, color: Colors.orangeAccent),
                    ),
                    Text(
                      snapshot.data![index].rating.toString()!,
                      style: TextStyle(fontSize: 22, color: Colors.orangeAccent),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}