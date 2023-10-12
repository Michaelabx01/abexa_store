// Archivo: carrito_screen.dart

import 'package:flutter/material.dart';
import 'package:abexastore/config/cars.dart';

class CarritoScreen extends StatefulWidget {
  final List<CarModel> carrosSeleccionados;

  const CarritoScreen({Key? key, required this.carrosSeleccionados}) : super(key: key);

  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  final Map<CarModel, int> _carroCount = {};

  @override
  void initState() {
    super.initState();
    _initializeCarCounts();
  }

  void _initializeCarCounts() {
    for (var carro in widget.carrosSeleccionados) {
      _carroCount[carro] = _carroCount.containsKey(carro) ? _carroCount[carro]! + 1 : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: _carroCount.length,
        itemBuilder: (context, index) {
          final carModel = _carroCount.keys.elementAt(index);
          final count = _carroCount[carModel] ?? 0;

          return _buildCarCard(carModel, count);
        },
      ),
    );
  }

  Widget _buildCarCard(CarModel carModel, int count) {
    return Dismissible(
      key: Key(carModel.modelo),
      onDismissed: (direction) {
        setState(() {
          _carroCount.remove(carModel);
        });
      },
      background: Container(
        color: const Color.fromARGB(255, 238, 236, 236),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                carModel.imageAsset,
                width: 100,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      carModel.modelo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('Cantidad: $count'),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
