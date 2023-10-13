// ignore_for_file: library_private_types_in_public_api
import 'package:abexastore/ui/Pages/Venta/Shopping_Screen.dart';
import 'package:flutter/material.dart';
import 'package:abexastore/config/cars.dart';
import 'package:abexastore/ui/Pages/Detalles/CarDetailScreen.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final int value; 

  const Badge({
    Key? key,
    required this.child,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value.toString(), 
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
class ShoppingScreen extends StatefulWidget {
  static const String modelo = 'shopping_screen';

  const ShoppingScreen({super.key});

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<CarModel> carrosSeleccionados = [];

  void addToCart(CarModel carModel) {
    setState(() {
      carrosSeleccionados.add(carModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ordenar la lista de carModels por nombre antes de mostrarla
    carModels.sort((a, b) => a.modelo.compareTo(b.modelo));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
          icon: Badge(
            value: carrosSeleccionados.length,
            child: const Icon(Icons.shopping_cart),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarritoScreen(carrosSeleccionados: carrosSeleccionados),
              ),
            );
          },
        ),

        ],
      ),
      body: Shopping(carModels: carModels, addToCart: addToCart),
      backgroundColor: Colors.grey[200],
    );
  }
}

class Shopping extends StatelessWidget {
  final List<CarModel> carModels;
  final Function(CarModel) addToCart;

  const Shopping({Key? key, required this.carModels, required this.addToCart}) : super(key: key);

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
                    Text(carModel.location),
                  ],
                ),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      
                      addToCart(carModel);
                    },
                    child: const Text('Comprar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

