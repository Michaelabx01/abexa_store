
import 'package:abexastore/models/Register.dart';
import 'package:flutter/material.dart';

class RegisterCars extends StatefulWidget {
  const RegisterCars({super.key});

  @override
  _RegisterCarsState createState() => _RegisterCarsState();
}

class _RegisterCarsState extends State<RegisterCars> {
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController sistemaController = TextEditingController();
  final TextEditingController cajaCambiosController = TextEditingController();
  final TextEditingController cilindrosController = TextEditingController();
  final TextEditingController combustibleController = TextEditingController();
  final TextEditingController millasController = TextEditingController();
  final TextEditingController anoController = TextEditingController();

  List<Car> cars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Registro de Carros'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Marca del carro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Modelo del carro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Sistema de Propulsión',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Caja de Cambios',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Cilindros',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tipo de Combustible',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Millas por Galón',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Año del carro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Car newCar = Car(
                    marca: marcaController.text,
                    modelo: modeloController.text,
                    sistemaPropulsion: sistemaController.text,
                    cajaCambios: cajaCambiosController.text,
                    cilindros: int.parse(cilindrosController.text),
                    tipoCombustible: combustibleController.text,
                    millasPorGalon: double.parse(millasController.text),
                    fecha: int.parse(anoController.text),
                  );

                  setState(() {
                    cars.add(newCar);
                  });
                  marcaController.clear();
                  modeloController.clear();
                  sistemaController.clear();
                  cajaCambiosController.clear();
                  cilindrosController.clear();
                  combustibleController.clear();
                  millasController.clear();
                  anoController.clear();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Registrar Carro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

