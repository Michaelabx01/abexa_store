
import 'package:flutter/material.dart';
import 'package:abexastore/models/cars.dart';
import 'package:abexastore/ui/Pages/Detalles/CarDetailScreen.dart';

class ShoppingScreen extends StatelessWidget {
  static const String name = 'shopping_screen';

  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ordenar la lista de carModels por nombre antes de mostrarla
    carModels.sort((a, b) => a.name.compareTo(b.name));
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
      ),
      body: Shopping(carModels: carModels),
      backgroundColor: Colors.grey[200],
    );
  }
}

class Shopping extends StatelessWidget {
  final List<CarModel> carModels;

  const Shopping({Key? key, required this.carModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carModels.length,
      itemBuilder: (context, index) {
        final carModel = carModels[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(carModel: carModel),
                ),
              );
            },
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
                    Text(
                      carModel.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(carModel.location),
                  ],
                ),
                const Spacer(), 
                const Text(
                  '**********',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ));
        },
      );
  }
}
