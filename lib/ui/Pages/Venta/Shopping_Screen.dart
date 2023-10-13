// ignore_for_file: unused_field, library_private_types_in_public_api, unused_element

import 'package:abexastore/ui/Pages/Venta/Archive_Shopping.dart';
import 'package:abexastore/utils/message.dart';
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
  final List<CarModel> _archivedCars = [];
  CarModel? _lastRemovedCar;
  int? _lastRemovedIndex;

    void _showUndoSnackBar() {
    showUndoSnackBar(
      context: context,
      message: 'Vehículo eliminado',
      onUndo: () {
        setState(() {
          if (_lastRemovedIndex != null && _lastRemovedCar != null) {
            widget.carrosSeleccionados.insert(_lastRemovedIndex!, _lastRemovedCar!);
          }
        });
      },
    );
  }

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

 void _archiveCar(CarModel carModel) {
  setState(() { 
    _carroCount.remove(carModel);  
    _archivedCars.add(carModel);
    widget.carrosSeleccionados.add(carModel);
  });
}

  void _deleteCar(CarModel carModel) {
    setState(() {
      _carroCount.remove(carModel);
    });
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
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    
    final restoredCar = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArchivedCarsScreen(archivedCars: _archivedCars)),
    );

    if (restoredCar != null) {
      setState(() {
        widget.carrosSeleccionados.add(restoredCar);
        _carroCount[restoredCar] = _carroCount.containsKey(restoredCar) ? _carroCount[restoredCar]! + 1 : 1;
      });
    }
  },
  child: const Icon(Icons.archive),
),

    );
  }

  Widget _buildCarCard(
    CarModel carModel, 
    int count
    ) {
    return Dismissible(
      key: Key(carModel.modelo),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          
          _archiveCar(carModel);
        } else if (direction == DismissDirection.endToStart) {
          _deleteCar(carModel);
          _lastRemovedCar = widget.carrosSeleccionados.removeAt(widget.carrosSeleccionados.indexOf(carModel));
          _lastRemovedIndex = widget.carrosSeleccionados.indexOf(carModel);
          _showUndoSnackBar();
          
        }
      },
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(
          Icons.archive,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
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
                  SizedBox(
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
              Text(
                '\$${carModel.price * count}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

