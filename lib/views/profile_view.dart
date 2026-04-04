import 'package:auth_example/services/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: ProfileService().getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                leading: Image.network(snapshot.data!.image),
                title: Text(snapshot.data!.firstName),
                subtitle: Text(snapshot.data!.email),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("Error,");
            }
          },
        ),
      ),
    );
  }
}
