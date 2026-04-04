import 'package:flutter/material.dart';
import 'package:rest_api_session_3/models/laptop_model.dart';
import 'package:rest_api_session_3/services/laptop_service.dart';

class LaptopView extends StatefulWidget {
  const LaptopView({super.key});

  @override
  State<LaptopView> createState() => _LaptopViewState();
}

class _LaptopViewState extends State<LaptopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool isCreated = await LaptopService().create(
            newItem: LaptopModel(
              name: "Dell",
              color: "Red",
              price: 1500,
              image:
                  "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/dell-plus/db16255/media-gallery/non-touch/laptop-dell-plus-db16255nt-ice-bl-fpr-gallery-5.psd?fmt=png-alpha&pscan=auto&scl=1&hei=804&wid=979&qlt=100,1&resMode=sharp2&size=979,804&chrss=full",
            ),
          );
          if (isCreated) {
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("failed to create new laptop"),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: LaptopService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LaptopModel> laptops = snapshot.data!;
            return ListView.builder(
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 70,
                      child: Image.network(
                        laptops[index].image!,
                        errorBuilder: (context, _, _) {
                          return Icon(Icons.warning);
                        },
                      ),
                    ),
                    title: Text(laptops[index].name!),
                    subtitle: Text(
                      "${laptops[index].color!} - price: ${laptops[index].price!}",
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              bool isUpdated = await LaptopService()
                                  .update(
                                    updatedItem: laptops[index].copyWith(
                                      name: "Acer",
                                      price: 800,
                                    ),
                                  );
                              if (isUpdated) {
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "failed to updated new laptop",
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.edit),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: () async {
                                                            bool isDeleted = await 
                                  LaptopService().delete(
                                    deleteItemId: laptops[index].id!
                                  );
                              if (isDeleted) {
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "failed to delete new laptop",
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LinearProgressIndicator());
          } else {
            return Center(child: Text("error, try again later...."));
          }
        },
      ),
    );
  }
}
