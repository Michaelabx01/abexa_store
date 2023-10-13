// ignore_for_file: library_private_types_in_public_api

import 'package:abexastore/config/Register.dart';
import 'package:abexastore/utils/message.dart';
import 'package:flutter/material.dart';

class RegisteredCarsScreen extends StatefulWidget {
  final List<Car> registeredCars;

  const RegisteredCarsScreen({Key? key, required this.registeredCars}) : super(key: key);

  @override
  _RegisteredCarsScreenState createState() => _RegisteredCarsScreenState();
}

class _RegisteredCarsScreenState extends State<RegisteredCarsScreen> {
  Car? _lastRemovedCar;
  int? _lastRemovedIndex;

  void _showUndoSnackBar() {
    showUndoSnackBar(
      context: context,
      message: 'Vehículo eliminado',
      onUndo: () {
        setState(() {
          if (_lastRemovedIndex != null && _lastRemovedCar != null) {
            widget.registeredCars.insert(_lastRemovedIndex!, _lastRemovedCar!);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehiculos Registrados'),
      ),
      body: ListView.builder(
        itemCount: widget.registeredCars.length,
        itemBuilder: (context, index) {
          Car car = widget.registeredCars[index];

          return Dismissible(
            key: Key(car.id.toString()),
            onDismissed: (direction) {
              setState(() {
                _lastRemovedCar = widget.registeredCars.removeAt(index);
                _lastRemovedIndex = index;
              });

              _showUndoSnackBar();
            },
            background: Container(
              color: Colors.grey[200],
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/icon.png',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Vehiculo ID: ${car.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Modelo: ${car.modelo}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Locación: ${car.location}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Precio: \$${car.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Km: ${car.Kilometros}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Año: ${car.fecha}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Puertas: ${car.Puerta}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text('Descripción: ${car.Descripcion}',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}