class Ticket {
  String id; 
  String flightNumber;
  String airline;
  String passengerName;
  String origin;
  String destination;
  String seat;
  String travelClass;

  Ticket({
    required this.flightNumber,
    required this.airline,
    required this.passengerName,
    required this.origin,
    required this.destination,
    required this.seat,
    required this.travelClass,
    this.id = '', 
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'flightNumber': flightNumber,
      'airline': airline,
      'passengerName': passengerName,
      'origin': origin,
      'destination': destination,
      'seat': seat,
      'travelClass': travelClass,
    };
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] ?? '',
      flightNumber: json['flightNumber'],
      airline: json['airline'],
      passengerName: json['passengerName'],
      origin: json['origin'],
      destination: json['destination'],
      seat: json['seat'],
      travelClass: json['travelClass'],
    );
  }
}
