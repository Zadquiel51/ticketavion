import 'package:flutter/material.dart';
import 'ticket_form.dart';
import 'ticket_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket App'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicketList()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: TicketForm(),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
