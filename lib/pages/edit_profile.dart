import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfile extends StatefulWidget {
  String image;
  EditProfile({super.key, required this.image});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
              fontFamily: 'Gilroy', fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              radius: 40,
            ),
            TextButton(
                onPressed: () {}, child: const Text("Change profile photo")),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
