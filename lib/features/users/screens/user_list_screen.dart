import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';
import 'add_user_screen.dart';
import 'edit_user_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users CRUD App"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: provider.fetchUsers,
        child: Builder(
          builder: (context) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.error != null) {
              return Center(
                child: Text(
                  provider.error!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (provider.users.isEmpty) {
              return const Center(child: Text("No users found"));
            }

            return ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditUserScreen(user: user),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            provider.deleteUser(user.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddUserScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}