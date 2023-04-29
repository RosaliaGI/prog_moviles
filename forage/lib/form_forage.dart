import 'package:flutter/material.dart';
import 'package:forage/providers/forage_provider.dart';
import 'package:provider/provider.dart';

class FormForage extends StatelessWidget {
  const FormForage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: context.watch<ForageProvider>().nameController,
          ),
          TextField(
            controller: context.watch<ForageProvider>().locationController,
          ),
          Checkbox(
              value: context.watch<ForageProvider>().isSelected,
              onChanged: (newValue) {
                context.watch<ForageProvider>().setIsSelected(newValue);
              }),
          TextField(
            controller: context.watch<ForageProvider>().notesController,
          ),
        ],
      ),
    );
  }
}
