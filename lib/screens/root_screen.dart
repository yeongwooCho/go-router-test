import 'package:flutter/material.dart';
import 'package:go_router_theory/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Placeholder(),
    );
  }
}
