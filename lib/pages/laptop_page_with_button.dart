import 'package:flutter/material.dart';
import 'package:rest_api_session_2/services/laptop_service.dart';

class LaptopPageWithButton extends StatefulWidget {
  const LaptopPageWithButton({super.key});

  @override
  State<LaptopPageWithButton> createState() => _LaptopPageWithButtonState();
}

class _LaptopPageWithButtonState extends State<LaptopPageWithButton> {
  List<dynamic>? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await LaptopService().getAllLaptop();
          setState(() {});
        },
      ),
      body: result == null
          ? Center(child: Text("Error, please press the button again..."))
          : result!.isEmpty
          ? Center(child: Text("No data"))
          : ListView.builder(
              itemCount: result!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 70,
                    child: Image.network(result![index]["image"]),
                  ),
                  title: Text(result![index]["name"]),
                  subtitle: Text(result![index]["color"]),
                  trailing: Text(result![index]["price"].toString()),
                );
              },
            ),
    );
  }
}
