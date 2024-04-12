// ignore_for_file: constant_identifier_names

enum Unit{

  PIECES,
  KILOGRAM,
  GRAM,
  LITERS,
  METERS;

  static Unit fromMap(Map<String, dynamic> map) {
    switch(map['unit']){
      case 'PIECES': return Unit.PIECES;
      case 'KILOGRAM': return Unit.KILOGRAM;
      case 'GRAM': return Unit.GRAM;
      case 'LITERS': return Unit.LITERS;
      case 'METERS': return Unit.METERS;
      default: return Unit.PIECES;
    }
  }

  Map<String, dynamic> toMap() {
    switch(this){
      case Unit.PIECES: return {'unit': 'PIECES'};
      case Unit.KILOGRAM: return {'unit': 'KILOGRAM'};
      case Unit.GRAM: return {'unit': 'GRAM'};
      case Unit.LITERS: return {'unit': 'LITERS'};
      case Unit.METERS: return {'unit': 'METERS'};
      default: return {'unit': 'PIECES'};
    }
  }

  static Unit fromString(String unit) {
    switch(unit){
      case 'PIECES': return Unit.PIECES;
      case 'KILOGRAM': return Unit.KILOGRAM;
      case 'GRAM': return Unit.GRAM;
      case 'LITERS': return Unit.LITERS;
      case 'METERS': return Unit.METERS;
      default: return Unit.PIECES;
    }
  }

  @override
  String toString() {
    switch(this){
      case Unit.PIECES: return 'PIECES';
      case Unit.KILOGRAM: return 'KILOGRAM';
      case Unit.GRAM: return 'GRAM';
      case Unit.LITERS: return 'LITERS';
      case Unit.METERS: return 'METERS';
      default: return 'PIECES';
    }
  }

  String toShortString() {
    switch(this){
      case Unit.PIECES: return 'szt';
      case Unit.KILOGRAM: return 'kg';
      case Unit.GRAM: return 'g';
      case Unit.LITERS: return 'l';
      case Unit.METERS: return 'm';
      default: return 'szt';
    }
  }
}
