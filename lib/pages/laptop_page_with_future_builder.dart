import 'package:flutter/material.dart';
import 'package:rest_api_session_2/pages/one_laptop_page.dart';
import 'package:rest_api_session_2/services/laptop_service.dart';

class LaptopPageWithFutureBuilder extends StatelessWidget {
  const LaptopPageWithFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("all laptops page")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OneLaptopPage()),
          );
        },
      ),
      body: FutureBuilder(
        future: LaptopService().getAllLaptop(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 70,
                    child: Image.network(snapshot.data![index].image),
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].color),
                  trailing: Text(snapshot.data![index].price.toString()),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("there is no data, try again later..."));
          }
        },
      ),
    );
  }
}
