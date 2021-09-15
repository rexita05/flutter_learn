import 'package:flutter/material.dart';
import '';

class Komputer extends StatelessWidget {
  const Komputer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        restorationId: 'list',
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for(int i=1;i<21;i++)
            Card(
              color: Colors.white54,
              child: ListTile(
                leading: const ExcludeSemantics(
                  child: CircleAvatar(
                    child: Icon(Icons.chat_outlined, color: Colors.black, size: 25.0),
                  ),
                ),
                title: Text('Status $i'),
              ),
            )
        ],
      ),
    );
  }
}