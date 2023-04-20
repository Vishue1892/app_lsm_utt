import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  String? profileImageUrl;

  User({required this.name, required this.email, this.profileImageUrl});
}
