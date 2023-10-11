import 'package:flutter/cupertino.dart';

class Car {
  String marca;
  String modelo;
  String sistemaPropulsion;
  String cajaCambios;
  int cilindros;
  String tipoCombustible;
  double millasPorGalon;
  int fecha;

  Car({
    required this.marca,
    required this.modelo,
    required this.sistemaPropulsion,
    required this.cajaCambios,
    required this.cilindros,
    required this.tipoCombustible,
    required this.millasPorGalon,
    required this.fecha,
  });
}

