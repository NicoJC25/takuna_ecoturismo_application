import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RouteSelectionScreen extends StatelessWidget {
  const RouteSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        late double sizedBoxHeight;
        if (constraints.maxWidth > 600) {
          sizedBoxHeight = 30;
        } else {
          sizedBoxHeight = 50;
        }
        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: sizedBoxHeight),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.brown,
                        )),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  'Rutas',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/fondorutas .png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                  ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 600) {
                      return SingleChildScrollView(
                          child: Column(
                        children: [
                          const Center(child: SizedBox(height: 50)),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Stack(children: [
                                    //RUTA 1
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context,
                                            'Sendero La Patria Corozal Ascenso');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 1',
                                        kilometers: '5',
                                        minutes: '154',
                                      ),
                                    ),
                                    Positioned(
                                        width: 120,
                                        left: 180,
                                        top: 18,
                                        child: Image.asset(
                                            'assets/Recurso 18-100.png'))
                                  ]),
                                  //RUTA 3
                                  Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context,
                                            'Sendero cancha San Julian');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 3',
                                        kilometers: '4.6',
                                        minutes: '113',
                                      ),
                                    ),
                                    Positioned(
                                        width: 70,
                                        left: 215,
                                        top: 25,
                                        child: Image.asset(
                                            'assets/Recurso 21-100.png'))
                                  ]),
                                  //RUTA 5
                                  Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context,
                                            'Sendero Farrallones El Jardin');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 5',
                                        kilometers: '2.8',
                                        minutes: '70',
                                      ),
                                    ),
                                    Positioned(
                                        width: 80,
                                        left: 200,
                                        top: 42,
                                        child: Image.asset(
                                            'assets/Recurso 19-100.png')),
                                  ]),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  //RUTA 2
                                  Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context,
                                            'Sendero La Patria Corozal Descenso');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 2',
                                        kilometers: '4.3',
                                        minutes: '104',
                                      ),
                                    ),
                                    Positioned(
                                        width: 80,
                                        left: 200,
                                        top: 42,
                                        child: Image.asset(
                                            'assets/Recurso 19-100.png')),
                                  ]),
                                  //RUTA 4
                                  Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context, 'Sendero Cruz de Dozule');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 4',
                                        kilometers: '7.8',
                                        minutes: '260',
                                      ),
                                    ),
                                    Positioned(
                                        width: 120,
                                        left: 180,
                                        top: 18,
                                        child: Image.asset(
                                            'assets/Recurso 18-100.png'))
                                  ]),
                                  //RUTA 6
                                  Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context, 'Sendero Mateguada');
                                      },
                                      child: const _ContainterRouteSelector(
                                        route: 'Ruta 6',
                                        kilometers: '2.8',
                                        minutes: '94',
                                      ),
                                    ),
                                    Positioned(
                                        width: 70,
                                        left: 215,
                                        top: 25,
                                        child: Image.asset(
                                            'assets/Recurso 21-100.png'))
                                  ]),
                                ],
                              ))
                            ],
                          )
                        ],
                      ));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const Center(
                                child: SizedBox(
                              height: 50,
                            )),
                            //RUTA 1
                            Stack(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context,
                                          'Sendero La Patria Corozal Ascenso');
                                    },
                                    child: const _ContainterRouteSelector(
                                        route: 'Ruta 1',
                                        kilometers: '5',
                                        minutes: '154')),
                                Positioned(
                                    width: 120,
                                    left: 180,
                                    top: 18,
                                    child: Image.asset(
                                        'assets/Recurso 18-100.png'))
                              ],
                            ),
                            const SizedBox(height: 20),
                            //RUTA 2
                            Stack(children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context,
                                        'Sendero La Patria Corozal Descenso');
                                  },
                                  child: const _ContainterRouteSelector(
                                      route: 'Ruta 2',
                                      kilometers: '4.3',
                                      minutes: '104')),
                              Positioned(
                                  width: 80,
                                  left: 200,
                                  top: 42,
                                  child:
                                      Image.asset('assets/Recurso 19-100.png')),
                            ]),
                            const SizedBox(height: 20),
                            //RUTA 3
                            Stack(children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                        context, 'Sendero cancha San Julian');
                                  },
                                  child: const _ContainterRouteSelector(
                                      route: 'Ruta 3',
                                      kilometers: '4.6',
                                      minutes: '113')),
                              Positioned(
                                  width: 70,
                                  left: 215,
                                  top: 25,
                                  child:
                                      Image.asset('assets/Recurso 21-100.png'))
                            ]),
                            const SizedBox(height: 20),
                            //RUTA 4
                            Stack(children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                        context, 'Sendero Cruz de Dozule');
                                  },
                                  child: const _ContainterRouteSelector(
                                      route: 'Ruta 4',
                                      kilometers: '7.8',
                                      minutes: '260')),
                              Positioned(
                                  width: 120,
                                  left: 180,
                                  top: 18,
                                  child:
                                      Image.asset('assets/Recurso 18-100.png'))
                            ]),
                            //RUTA 5
                            const SizedBox(height: 20),
                            Stack(children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context,
                                        'Sendero Farrallones El Jardin');
                                  },
                                  child: const _ContainterRouteSelector(
                                      route: 'Ruta 5',
                                      kilometers: '2.8',
                                      minutes: '70')),
                              Positioned(
                                  width: 80,
                                  left: 200,
                                  top: 42,
                                  child:
                                      Image.asset('assets/Recurso 19-100.png')),
                            ]),
                            const SizedBox(height: 20),
                            //RUTA 6
                            Stack(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context, 'Sendero Mateguada');
                                    },
                                    child: const _ContainterRouteSelector(
                                        route: 'Ruta 6',
                                        kilometers: '2.8',
                                        minutes: '94')),
                                Positioned(
                                    width: 70,
                                    left: 215,
                                    top: 25,
                                    child: Image.asset(
                                        'assets/Recurso 21-100.png'))
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}

//CONFIGURACION VISUAL PARA TODOS LOS CONTENEDORES
class _ContainterRouteSelector extends StatelessWidget {
  final String route;
  final String kilometers;
  final String minutes;
  const _ContainterRouteSelector(
      {required this.route, required this.kilometers, required this.minutes});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: 180,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  route,
                  style: TextStyle(
                      fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: kilometers,
                            style: const TextStyle(
                                fontFamily: 'RadioATreqer',
                                fontSize: 20,
                                color: Colors.green),
                          ),
                          const TextSpan(
                            text: ' km',
                            style: TextStyle(
                                fontFamily: 'RadioATreqer',
                                fontSize: 12,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: minutes,
                            style: const TextStyle(
                                fontFamily: 'RadioATreqer',
                                fontSize: 20,
                                color: Colors.green),
                          ),
                          const TextSpan(
                            text: ' MIN',
                            style: TextStyle(
                                fontFamily: 'RadioATreqer',
                                fontSize: 12,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '  Distancia      Duración',
                  style: TextStyle(
                      fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                      fontSize: 10),
                )
              ],
            ))
          ],
        ));
  }
}
