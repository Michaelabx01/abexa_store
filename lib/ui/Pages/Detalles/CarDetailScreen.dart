// ignore_for_file: file_names

import 'package:abexastore/config/cars.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  final CarModel carModel;

  const CarDetailScreen({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(carModel.modelo),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                carModel.imageAsset,
                width: 200,
              ),
              const SizedBox(height: 16.0),
             Text(
            carModel.modelo,
            textAlign: TextAlign.center,  
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

              const SizedBox(height: 16.0),
              Text(
                carModel.location,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16.0),
              Text(
                '\$ ${carModel.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Km: ${carModel.Kilometros}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Año: ${carModel.fecha}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Puertas: ${carModel.Puerta}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

              const SizedBox(height: 16.0),
              Row(
              children: const <Widget>[
                Icon(Icons.access_time, size: 18), // Use any icon you prefer
                SizedBox(width: 8), // Add spacing between icon and text
                Text(
                  "Descripción",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 9.0),
            Text(
              carModel.Descripcion,
              style: const TextStyle(fontSize: 16),
            ),

              const SizedBox(height: 16.0),
          
            ],
          ),
        ),
      ),
    );
  }
}
