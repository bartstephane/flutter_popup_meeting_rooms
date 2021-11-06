class Room {
  final int id;
  final String room_name;
  final int building_floor;
  final bool detected;

  const Room({
    required this.id,
    required this.room_name,
    required this.building_floor,
    required this.detected,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as int,
      room_name: json['room_name'] as String,
      building_floor: json['building_floor'] as int,
      detected: json['detected'] as bool,
    );
  }

}