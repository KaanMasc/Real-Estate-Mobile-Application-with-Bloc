import 'package:api/product/services/user_repository.dart';
import 'package:flutter/material.dart';

import './profile_page.dart';

abstract class ProfilePageViewModel extends State<ProfilePage> {
  late final IUserRepository userRepository;

  @override
  void initState() {
    userRepository = UserRepository();
    super.initState();
  }
}
