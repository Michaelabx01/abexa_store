import 'package:abexastore/config/cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchivedCarsScreen extends StatelessWidget {
  final List<CarModel> archivedCars;

  const ArchivedCarsScreen({Key? key, required this.archivedCars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elementos Archivados'),
      ),
      body: ListView.builder(
        itemCount: archivedCars.length,
        itemBuilder: (context, index) {
          final carModel = archivedCars[index];
          
          return Dismissible(
            key: Key(carModel.modelo),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
              }
            },
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20.0),
              child: const Icon(
                Icons.restore,
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
                ],
              ),
              const Spacer(),
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