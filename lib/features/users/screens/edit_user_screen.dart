 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import '../model/user_model.dart';

class EditUserScreen extends StatefulWidget {
  final UserModel user;

  const EditUserScreen({
    super.key,
    required this.user,
  });

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: widget.user.name,
    );

    emailController = TextEditingController(
      text: widget.user.email,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await provider.updateUser(
                  widget.user.id,
                  nameController.text,
                  emailController.text,
                );

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}