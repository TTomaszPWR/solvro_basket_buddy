enum Unit{

  PIECES,
  KILOGRAM,
  GRAM,
  LITER,
  METER;

  static Unit fromMap(Map<String, dynamic> map) {
    switch(map['unit']){
      case 'PIECES': return Unit.PIECES;
      case 'KILOGRAM': return Unit.KILOGRAM;
      case 'GRAM': return Unit.GRAM;
      case 'LITER': return Unit.LITER;
      case 'METER': return Unit.METER;
      default: return Unit.PIECES;
    }
  }

  Map<String, dynamic> toMap() {
    switch(this){
      case Unit.PIECES: return {'unit': 'PIECES'};
      case Unit.KILOGRAM: return {'unit': 'KILOGRAM'};
      case Unit.GRAM: return {'unit': 'GRAM'};
      case Unit.LITER: return {'unit': 'LITER'};
      case Unit.METER: return {'unit': 'METER'};
      default: return {'unit': 'PIECES'};
    }
  }
}
