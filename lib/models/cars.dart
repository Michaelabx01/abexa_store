import 'package:flutter/material.dart';

class CarModel {
  final String name;
  final String location;
  final double price;
  final int Kilometros;
  final int fecha;
  final String Puerta;
  final String Descripcion;
  final String imageAsset; 

  CarModel({
    required this.name,
    required this.location,
    required this.price,
    required this.imageAsset,
    required this.Kilometros,
    required this.fecha,
    required this.Puerta,
    required this.Descripcion,
  });
}

List<CarModel> carModels = [
  CarModel(
    name: 'Chevrolet Onix',
    location: 'Peru - Lima - Los Olivos',
    price: 11500,
    imageAsset: 'assets/images/ChevroletOnix.png', 
    Kilometros: 10000,
    fecha: 2019,
    Puerta: '4',
    Descripcion: 'El Chevrolet Onix es un automóvil de turismo del segmento B producido por el fabricante estadounidense Chevrolet para América del Sur. Es un cinco plazas con carrocerías hatchback de cinco puertas y sedán de cuatro puertas, y motor delantero transversal y tracción delantera. Reemplazó al Chevrolet Celta y al Chevrolet Prisma. Se presentó en el Salón del Automóvil de San Pablo de 2012 y se comenzó a vender en Brasil en noviembre de 2012. En 2013 se lanzó en Argentina, y en 2014 en Colombia, Ecuador, Paraguay, Perú, Uruguay y Venezuela. En 2015 se lanzó en México, y en 2017 en Bolivia. En 2019 se lanzó en Chile. En 2020 se lanzó en Costa Rica, Panamá y República Dominicana. En 2021 se lanzó en Guatemala, Honduras, Nicaragua y El Salvador.',

  ),
  CarModel(
    name: 'Kia Rio',
    location: 'Peru - Lima - San Miguel',
    price: 12500,
    imageAsset: 'assets/images/KiaRio.png', 
    Kilometros: 20000,
    fecha: 2018,
    Puerta: '4',
    Descripcion: 'El Kia Rio es un automóvil de turismo del segmento B producido por el fabricante surcoreano Kia Motors desde agosto de 2000 hasta la actualidad. Es un cinco plazas con carrocerías hatchback de cinco puertas y sedán de cuatro puertas, y motor delantero transversal y tracción delantera. Reemplazó al Kia Pride y al Kia Avella. Se presentó en el Salón del Automóvil de Ginebra de 2000 y se comenzó a vender en Corea del Sur en agosto de 2000. En 2001 se lanzó en Europa, y en 2002 en América. En 2005 se lanzó la segunda generación, en 2011 la tercera y en 2017 la cuarta. En 2018 se lanzó la cuarta generación en América. En 2020 se lanzó la cuarta generación en Europa. En 2021 se lanzó la cuarta generación en Corea del Sur.',

  ),
   CarModel(
    name: 'Nissan Sentra',
    location: 'Peru - Lima - Surco',
    price: 14000,
     imageAsset: 'assets/images/NissanSentra.png', 
      Kilometros: 30000,
    fecha: 2017,
    Puerta: '4',
    Descripcion: 'El Nissan Sentra es un automóvil de turismo del segmento C producido por el fabricante japonés Nissan desde 1982. Es un cinco plazas con carrocerías sedán de cuatro puertas y hatchback de cinco puertas, y motor delantero transversal y tracción delantera. Reemplazó al Nissan Sunny y al Nissan Pulsar. Se presentó en el Salón del Automóvil de Tokio de 1981 y se comenzó a vender en Japón en mayo de 1982. En 1983 se lanzó en Estados Unidos, y en 1984 en Europa. En 1986 se lanzó la segunda generación, en 1990 la tercera, en 1995 la cuarta, en 2000 la quinta, en 2006 la sexta, en 2012 la séptima y en 2019 la octava. En 2020 se lanzó la octava generación en América. En 2021 se lanzó la octava generación en Europa.',
  ),
   CarModel(
    name: 'Toyota Corolla',
    location: 'Peru - Lima - Lince',
    price: 16000,
    imageAsset: 'assets/images/ToyotaCorolla.png', 
    Kilometros: 40000,
    fecha: 2016,
    Puerta: '4',
    Descripcion: 'El Toyota Corolla es un automóvil de turismo del segmento C producido por el fabricante japonés Toyota desde 1966. Es el automóvil más vendido de la historia, con más de 40 millones de unidades vendidas. El nombre Corolla proviene de la corona de flores del latín que significa pequeña corona. Es un cinco plazas con carrocerías sedán de cuatro puertas, hatchback de cinco puertas y familiar de cinco puertas, y motor delantero transversal y tracción delantera. Reemplazó al Toyota Publica y al Toyota 1000. Se presentó en octubre de 1966 y se comenzó a vender en Japón en noviembre de 1966. En 1967 se lanzó en Europa, y en 1968 en América. En 1970 se lanzó la segunda generación, en 1974 la tercera, en 1979 la cuarta, en 1983 la quinta, en 1987 la sexta, en 1991 la séptima, en 1995 la octava, en 2000 la novena, en 2006 la décima, en 2012 la undécima y en 2018 la duodécima. En 2019 se lanzó la duodécima generación en América. En 2020 se lanzó la duodécima generación en Europa.',
  ),
   CarModel(
    name: 'Hyundai Elantra',
    location: 'Peru - Lima - El Agustino',
    price: 17000,
    imageAsset: 'assets/images/HyundaiElantra.png',
    Kilometros: 50000,
    fecha: 2015,
    Puerta: '4',
    Descripcion: 'El Hyundai Elantra es un automóvil de turismo del segmento C producido por el fabricante surcoreano Hyundai Motor Company desde 1990. Es un cinco plazas con carrocerías sedán de cuatro puertas y hatchback de cinco puertas, y motor delantero transversal y tracción delantera. Reemplazó al Hyundai Stellar y al Hyundai Pony. Se presentó en el Salón del Automóvil de Seúl de 1990 y se comenzó a vender en Corea del Sur en octubre de 1990. En 1991 se lanzó en Europa, y en 1992 en América. En 1995 se lanzó la segunda generación, en 2000 la tercera, en 2006 la cuarta, en 2010 la quinta, en 2015 la sexta y en 2020 la séptima. En 2021 se lanzó la séptima generación en América. En 2022 se lanzará la séptima generación en Europa.',
  ),
   CarModel(
    name: 'Nissan X-Trail',
    location: 'Peru - Lima - San Isidro',
    price: 22000,
     imageAsset: 'assets/images/NissanXTrail.png',
    Kilometros: 60000,
    fecha: 2014,
    Puerta: '4',
    Descripcion: 'El Nissan X-Trail es un automóvil todoterreno del segmento C producido por el fabricante japonés Nissan desde 2001. Es un cinco plazas con carrocerías todoterreno de cinco puertas y familiar de cinco puertas, y motor delantero transversal y tracción delantera o a las cuatro ruedas. Reemplazó al Nissan Rasheen y al Nissan Terrano II. Se presentó en el Salón del Automóvil de Tokio de 2000 y se comenzó a vender en Japón en noviembre de 2000. En 2001 se lanzó en Europa, y en 2002 en América. En 2007 se lanzó la segunda generación, en 2013 la tercera y en 2021 la cuarta. En 2021 se lanzó la cuarta generación en América. En 2022 se lanzará la cuarta generación en Europa.',
  ),
  // Agrega más modelos de carros aquí
];
