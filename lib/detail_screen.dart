import 'package:flutter/material.dart';
import 'ticket.dart'; 

class DetailScreen extends StatelessWidget {
  final Ticket ticket;

  DetailScreen({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del Ticket')),
      body: Column(
        children: [
          Text('Número de Vuelo: ${ticket.flightNumber}'),
          Text('Aerolínea: ${ticket.airline}'),
        ],
      ),
    );
  }
}
