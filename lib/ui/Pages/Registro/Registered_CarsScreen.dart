import 'package:abexastore/config/Register.dart';
import 'package:flutter/material.dart';

class RegisteredCarsScreen extends StatefulWidget {
  final List<Car> registeredCars;

  RegisteredCarsScreen({required this.registeredCars});

  @override
  _RegisteredCarsScreenState createState() => _RegisteredCarsScreenState();
}

class _RegisteredCarsScreenState extends State<RegisteredCarsScreen> {
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
                widget.registeredCars.removeAt(index);
              });
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                     ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 8.0,
                          bottom: 16.0,
                        ),
                        child: SizedBox(
                          width: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                            Center(
                            child: Icon(
                              Icons.car_crash,
                              size: 50.0,
                              color: Colors.grey,
                            ),
                          )
                            ],
                          ),
                        ),
                      ),
                    ),
                      const VerticalDivider(width: 1, thickness: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Vehiculo ID: ${car.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text('Modelo: ${car.modelo}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Locación: ${car.location}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Precio: \$${car.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Km: ${car.Kilometros}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Año: ${car.fecha}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Puertas: ${car.Puerta}',
                              style: const TextStyle(fontSize: 18)),
                          Text('Descripción: ${car.Descripcion}',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
