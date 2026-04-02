import 'package:flutter/material.dart';
import 'package:rest_api_session_2/services/laptop_service.dart';

class OneLaptopPage extends StatelessWidget {
  const OneLaptopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("one laptop page")),
      body: FutureBuilder(
        future: LaptopService().getOnelaptop(laptopId: 10),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListTile(
                leading: SizedBox(
                  width: 70,
                  child: Image.network(snapshot.data!.image),
                ),
                title: Text(snapshot.data!.name),
                subtitle: Text(snapshot.data!.color),
                trailing: Text(snapshot.data!.price.toString()),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
