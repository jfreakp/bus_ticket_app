import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuNav = <MenuItem>[
  MenuItem(
      title: 'Home',
      subTitle: 'Home',
      link: '/',
      icon: Icons.smart_button_outlined),

  MenuItem(
      title: '',
      subTitle: 'Perfil de Usuario',
      link: '/profile',
      icon: Icons.credit_card)
];
