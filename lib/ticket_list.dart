import 'package:flutter/material.dart';
import 'firestore_service.dart';
import 'ticket.dart';

class TicketList extends StatefulWidget {
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  final FirestoreService _firestoreService = FirestoreService();
  late Future<List<Ticket>> _tickets;

  @override
  void initState() {
    super.initState();
    _tickets = _firestoreService.getTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket List'),
      ),
      body: FutureBuilder<List<Ticket>>(
        future: _tickets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tickets found.'));
          }

          List<Ticket> tickets = snapshot.data!;

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${tickets[index].flightNumber} - ${tickets[index].passengerName}'),
                subtitle: Text('${tickets[index].origin} to ${tickets[index].destination}'),
                onTap: () {
                },
              );
            },
          );
        },
      ),
    );
  }
}
