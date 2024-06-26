import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_screen/model/home_model.dart';
import '../../cart_screen/view/screens/cart_screen.dart';
import '../../categories_screen/view/screens/categories_screen.dart';
import '../../home_screen/view/screens/home_screen.dart';
import '../../profile/view/screens/profile_screen.dart';
import '../../search_screen/view/screens/search_screen.dart';

List<Widget> screens = [
  const Home(),
  const Categories(),
  const Cart(),
  const Search(),
  const Profile()
];
