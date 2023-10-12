import 'package:abexastore/config/Register.dart';
import 'package:abexastore/ui/Pages/Registro/Registered_CarsScreen.dart';
import 'package:flutter/material.dart';
class RegisterCars extends StatefulWidget {
  const RegisterCars({Key? key}) : super(key: key);

  @override
  _RegisterCarsState createState() => _RegisterCarsState();
}

class _RegisterCarsState extends State<RegisterCars> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController KilometrosController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController PuertaController = TextEditingController();
  final TextEditingController DescripcionController = TextEditingController();

  List<Car> cars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Registro de Vehiculos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'id del Vehiculo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: modeloController,
                decoration: InputDecoration(
                  labelText: 'Modelo del Vehiculo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Locacion del Vehiculo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Precio del Vehiculo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: KilometrosController,
                decoration: InputDecoration(
                  labelText: 'Kilometros',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: fechaController,
                decoration: InputDecoration(
                  labelText: 'Año de Fabricacion',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),

              const SizedBox(height: 10.0),
              TextField(
                controller: PuertaController,
                decoration: InputDecoration(
                  labelText: 'Puertas del Vehiculo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: DescripcionController,
                decoration: InputDecoration(
                  labelText: 'Descripcion del Vehiculo',
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
                id: int.parse(idController.text),
                modelo: modeloController.text,
                location: locationController.text,
                price: double.parse(priceController.text),
                Kilometros: int.parse(KilometrosController.text),
                fecha: int.parse(fechaController.text),
                Puerta: int.parse(PuertaController.text),
                Descripcion: DescripcionController.text,
              );

              setState(() {
                cars.add(newCar);
              });

              // Limpiar los controladores después de agregar el coche
              idController.clear();
              modeloController.clear();
              locationController.clear();
              priceController.clear();
              KilometrosController.clear();
              fechaController.clear();
              PuertaController.clear();
              DescripcionController.clear();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisteredCarsScreen(
                    registeredCars: cars,
                  ),
                ),
              );
            },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Registrar Vehiculo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisteredCarsScreen(
                registeredCars: cars,
              ),
            ),
          );
        },
        tooltip: 'Ver vehículos registrados',
        child: Icon(Icons.folder),
      ),
    );
  }
}
