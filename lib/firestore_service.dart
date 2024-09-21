import 'package:cloud_firestore/cloud_firestore.dart';
import 'ticket.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTicket(Ticket ticket) async {
    await _db.collection('tickets').add(ticket.toJson());
  }

  Future<List<Ticket>> getTickets() async {
    QuerySnapshot snapshot = await _db.collection('tickets').get();
    return snapshot.docs.map((doc) {
      return Ticket.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
