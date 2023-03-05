import 'package:flutter/material.dart';

class CreateOrUpdateLineItem extends StatelessWidget {
  const CreateOrUpdateLineItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Line Item'),
      ),
      body: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}
