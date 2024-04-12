import 'package:flutter/material.dart';

import '../../routes/route_utils.dart';

var kMainButtons = [
  const BtnMenu(
      id: 1,
      label: "Group Player",
      icon: Icons.group,
      route: APP_PAGE.groupPlayer,
      ""),
  const BtnMenu(
      id: 2,
      label: "Single Player",
      icon: Icons.person,
      route: APP_PAGE.singlePlayer,
      ""),
  const BtnMenu(
      id: 3,
      label: "Setting",
      icon: Icons.settings,
      route: APP_PAGE.settings,
      ""),
];


class BtnMenu {
  final int id;
  final String label;
  final IconData icon;
  final APP_PAGE route;
  final String serviceType;

  const BtnMenu(this.serviceType,
      {required this.id,
        required this.label,
        required this.icon,
        required this.route});
}