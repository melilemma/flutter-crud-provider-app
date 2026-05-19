 import 'package:flutter/material.dart';
import '../../../core/api/api_service.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _api = ApiService();

  List<UserModel> users = [];
  bool isLoading = false;
  String? error;

  UserProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final data = await _api.getUsers();
      users = data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // CREATE
  Future<void> addUser(String name, String email) async {
  try {
    isLoading = true;
    error = null;
    notifyListeners();

    // API still expects two strings; we can send email as the second value
    await _api.addUser(name, email);

    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      avatar: 'https://i.pravatar.cc/150?u=$name',
    );

    users.insert(0, newUser);
  } catch (e) {
    error = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
  // UPDATE
  Future<void> updateUser(String id, String name, String email) async {
  try {
    isLoading = true;
    error = null;
    notifyListeners();

    await _api.updateUser(id, name, email);

    final index = users.indexWhere((user) => user.id == id);

    if (index != -1) {
      users[index] = UserModel(
        id: users[index].id,
        name: name,
        email: email,
        avatar: users[index].avatar,
      );
    }
  } catch (e) {
    error = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

  // DELETE
  Future<void> deleteUser(String id) async {
    try {
      await _api.deleteUser(id);

      users.removeWhere((user) => user.id == id);
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}