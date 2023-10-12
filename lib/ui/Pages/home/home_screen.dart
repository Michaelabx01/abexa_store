// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'dart:developer';
import 'package:abexastore/config/cars.dart';
import 'package:flutter/material.dart';
import 'package:abexastore/ui/Pages/Registro/Register_cars.dart';
import 'package:abexastore/ui/Pages/Venta/shopping_cars.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<CarModel> _filteredCarModels = carModels; 
  bool isListVisible = false; 

  void _filterCars() {
    final searchTerm = _searchController.text.toLowerCase();
    setState(() {
      _filteredCarModels = carModels.where((car) {
        return car.modelo.toLowerCase().contains(searchTerm) ||
            car.location.toLowerCase().contains(searchTerm);
      }).toList();
      isListVisible = searchTerm.isNotEmpty; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 2, 64),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/cars1.png', width: 300, height: 300),
                  const SizedBox(height: 20),
                  const Text(
                    'Abexa Store',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _filterCars(); // Trigger filtering when the text changes.
                      },
                      decoration: const InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: TextButton(
                      onPressed: _filterCars, // Trigger filtering when the button is pressed.
                      child: const Text(
                        'Buscar Vehiculos',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterCars()),
                    );
                  },
                  onLongPress: () {
                    
                    log('Boton de Registro de Vehiculos');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.8);
                        }
                        return Colors.blue;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text('Registro de Vehiculos'),
                ),

                  ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ShoppingScreen()),
                      );
                    },
                  onLongPress: () {
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.8); 
                        }
                        return Colors.blue;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text('Venta de Vehiculos'),
                ),

                ],
              ),
            ),
            // Agregar un Visibility widget para controlar la visibilidad de la lista de carros.
            Visibility(
              visible: isListVisible,
              child: Column(
                children: _filteredCarModels.map((car) {
                  return Card(
                    margin: const EdgeInsets.all(10.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: Image.asset(car.imageAsset, width: 80, height: 80),
                      title: Text(car.modelo),
                      subtitle: Text(car.location),
                      trailing: Text('€ ${car.price.toStringAsFixed(2)}'),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
