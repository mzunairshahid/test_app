import 'package:flutter/material.dart';

class TableTitleBar extends StatelessWidget {
  const TableTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      color: Colors.blue,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: Text('Participation Name')),
            Expanded(child: Text('Title')),
            Expanded(child: Text('Category')),
            Expanded(child: Text('Duration')),
            Expanded(child: Text('Type')),
            Expanded(child: Text('Price')),
            Expanded(child: Text('Description')),
          ],
        ),
      ),
    );
  }
}
