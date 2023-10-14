// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:abexastore/config/Pay.dart';
import 'package:abexastore/config/cars.dart';

class PaymentScreen extends StatefulWidget {
  final List<CarModel> carrosSeleccionados;

  PaymentScreen({required this.carrosSeleccionados});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final Map<CarModel, int> _carroCount = {};
  double totalCost = 0.0;
  final Pay payData = Pay(descuento: 20.0, envio: 10.0);
  TextEditingController codeController = TextEditingController();

  Widget buildResumenItem(String label, String value, {bool showLabel = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showLabel) Text(label, style: const TextStyle(fontSize: 16)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  void initState() {
    super.initState();
    _initializeCarCounts();
    _calculateTotalCost();
  }

  void _initializeCarCounts() {
    for (var carro in widget.carrosSeleccionados) {
      _carroCount[carro] = _carroCount.containsKey(carro) ? _carroCount[carro]! + 1 : 1;
    }
  }

  void _calculateTotalCost() {
    totalCost = 0.0;
    for (var entry in _carroCount.entries) {
      totalCost += entry.key.price * entry.value;
    }
  }

  void _incrementCount(CarModel carModel) {
    setState(() {
      _carroCount[carModel] = (_carroCount[carModel] ?? 0) + 1;
      _calculateTotalCost();
    });
  }

  void _decrementCount(CarModel carModel) {
    setState(() {
      if (_carroCount[carModel] != null && _carroCount[carModel]! > 0) {
        _carroCount[carModel] = _carroCount[carModel]! - 1;
        _calculateTotalCost();
      }
    });
  }

void _showCodeInputDialog(BuildContext context) {
  final codeController = TextEditingController(); 

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: const Center(child: Text('Ingrese su código')), 
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: codeController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Código de 6 dígitos',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignLabelWithHint: true, 
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
           child: const Center(
            child: Text(
              'Guardar',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ),
        ],
      );
    },
  );
}


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Método de Pago'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.carrosSeleccionados.length,
              itemBuilder: (context, index) {
                final carModel = widget.carrosSeleccionados[index];
                final count = _carroCount[carModel] ?? 0;
                return ListTile(
                  leading: Image.asset(carModel.imageAsset, width: 60, height: 60),
                  title: Text(carModel.modelo),
                  subtitle: Text('Precio: \$${carModel.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _incrementCount(carModel),
                      ),
                      Text('$count'),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => _decrementCount(carModel),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 198, 198), 
                borderRadius: BorderRadius.circular(15.0), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resumen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.shopping_cart, color: Colors.green),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildResumenItem("Coste total de los artículos", "\$${totalCost.toStringAsFixed(2)}"),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: Colors.black), 
                  Row(
                    children: [
                      const Icon(Icons.money, color: Colors.red), 
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildResumenItem("Descuento", "\$${payData.descuento.toStringAsFixed(2)}"),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: Color.fromARGB(255, 100, 100, 100)), 
                  Row(
                    children: [
                      const Icon(Icons.local_offer, color: Colors.yellow), 
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text("Codigo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => _showCodeInputDialog(context),
                          child: const Text('Ingrese su código', style: TextStyle(decoration: TextDecoration.none, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: Color.fromARGB(255, 100, 100, 100)), 
                  Row(
                    children: [
                      const Icon(Icons.local_shipping, color: Colors.blueGrey), 
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildResumenItem("Costo de envío", "\$${payData.envio.toStringAsFixed(2)}"),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: Colors.black),
                  Row(
                    children: [
                      const Icon(Icons.check, color: Colors.black),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildResumenItem("Total", "\$${((totalCost + payData.envio) / payData.descuento).toStringAsFixed(2)}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const PaymentOptionsDialog();
              },
            );
          },
          child: const Text('Realizar Pedido'),
        )
        ],
      ),
    );
  }
}


class PaymentOptionsDialog extends StatefulWidget {
  const PaymentOptionsDialog({super.key});

  @override
  _PaymentOptionsDialogState createState() => _PaymentOptionsDialogState();
}

class _PaymentOptionsDialogState extends State<PaymentOptionsDialog> {
  bool creditCardSelected = false;
  bool paypalSelected = false;
  bool cashSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Metodos de Pago',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        buildPaymentOption('Tarjeta de Crédito', creditCardSelected, (value) {
        setState(() {
          creditCardSelected = value;
        });

        if (value) {
          _showCreditCardBottomSheet(context);
        }
      }),
          buildPaymentOption('PayPal', paypalSelected, (value) {
            setState(() {
              paypalSelected = value;
            });
          }),
          buildPaymentOption('Efectivo', cashSelected, (value) {
            setState(() {
              cashSelected = value;
            });
          }),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text('Confirmar Pedido'),
          ),
        ],
      ),
    );
  }

    Widget buildPaymentOption(String title, bool selected, void Function(bool) onChanged) {
      return ListTile(
        leading: Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: selected ? Colors.red : Colors.black, 
            ),
            color: selected ? Colors.red : Colors.white, 
          ),
          child: InkWell(
            onTap: () {
              onChanged(!selected);
            },
            child: selected
                ? const Icon(
                    Icons.check,
                    size: 20.0,
                    color: Colors.white, 
                  )
                : null,
          ),
        ),
        title: Text(title),
      );
    }

void _showCreditCardBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;
      final bottomSheetHeight = screenHeight * 0.6;
      return Container(
        height: bottomSheetHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Añadir tarjeta de crédito',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Número de tarjeta',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Ej. 1234 5678 9012 3456',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.credit_card, color: Colors.black),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'MM/AA',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Ej. 01/23',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Ej. 123',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del titular',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  'Guardar tarjeta',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: (value) {
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Guardar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
}


