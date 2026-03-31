import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<dynamic> reslut = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          reslut = await getPosts();
          setState(() {
            
          });
        },
        child: Icon(Icons.data_array),
      ),
      body: ListView.builder(
        itemCount: reslut.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: ListTile(
              title: Text(reslut[index]["title"]),
              subtitle: Text(reslut[index]["body"]),
              leading: CircleAvatar(child: Text(reslut[index]["id"].toString())),
              trailing: Text(reslut[index]["userId"].toString()),
            ),
          );
        },
      ),
    );
  }
}

Future<List<dynamic>> getPosts() async {
  final Dio dio = Dio();
  Response response = await dio.get(
    'https://jsonplaceholder.typicode.com/posts',
  );
  // print(response.statusCode);
  // print("==================================");
  print(response.data);
  return response.data;
}
