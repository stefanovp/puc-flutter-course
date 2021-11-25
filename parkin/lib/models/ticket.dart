final String tableTickets = 'tickets';

class TicketFields {
  static final List<String> values = [id, parkingName, vehiclePlate];

  static final String id = '_id';
  static final String parkingName = 'parkingName';
  static final String vehiclePlate = 'vehiclePlate';
}

class Ticket {
  final int? id;
  final String parkingName;
  final String vehiclePlate;

  const Ticket(
      {this.id, required this.parkingName, required this.vehiclePlate});

  static Ticket fromJson(Map<String, Object?> json) => Ticket(
      id: json[TicketFields.id] as int?,
      parkingName: json[TicketFields.parkingName] as String,
      vehiclePlate: json[TicketFields.vehiclePlate] as String);

  Map<String, Object?> toJson() => {
        TicketFields.id: id,
        TicketFields.parkingName: parkingName,
        TicketFields.vehiclePlate: vehiclePlate,
      };

  Ticket copy({int? id, String? parkingName, String? vehiclePlate}) => Ticket(
      id: id ?? this.id,
      parkingName: parkingName ?? this.parkingName,
      vehiclePlate: vehiclePlate ?? this.vehiclePlate);
}
