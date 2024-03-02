import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_theory/layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop('거 장난이 너무 심한거 아니오');
            },
            child: Text('Pop'),
          ),
        ],
      ),
    );
  }
}
