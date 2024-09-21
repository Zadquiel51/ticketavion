import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ticket_form.dart';
import 'ticket_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets de Avión'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut(); 
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: TicketList(), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TicketForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
