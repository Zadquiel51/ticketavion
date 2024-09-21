import 'package:flutter/material.dart';
import 'ticket.dart';
import 'firestore_service.dart';

class TicketForm extends StatefulWidget {
  @override
  _TicketFormState createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  final _formKey = GlobalKey<FormState>();
  String flightNumber = '';
  String airline = '';
  String passengerName = '';
  String origin = '';
  String destination = '';
  String seat = '';
  String travelClass = '';

  final FirestoreService _firestoreService = FirestoreService();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Ticket ticket = Ticket(
        flightNumber: flightNumber,
        airline: airline,
        passengerName: passengerName,
        origin: origin,
        destination: destination,
        seat: seat,
        travelClass: travelClass,
      );
      _firestoreService.addTicket(ticket);
      // Agrega lógica para limpiar el formulario o mostrar un mensaje
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => flightNumber = value,
            validator: (value) => value!.isEmpty ? 'Required' : null,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
