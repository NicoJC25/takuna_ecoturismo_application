import 'package:flutter/material.dart';
import 'package:takuna_ecoturismo_application/presentation/screens/loading_routes_screen.dart';

//Pantalla para testear
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMapSmall = false;
  Offset _mapPosition = Offset(10, 10);

  void _toggleMapSize() {
    setState(() {
      _isMapSmall = !_isMapSmall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pantalla principal (por ejemplo, una lista de rutas)
          Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                onPressed: _toggleMapSize,
                child: const Text('Mostrar mapa'),
              ),
            ),
          ),
          // Mapa animado y draggable
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isMapSmall ? _mapPosition.dx : 0,
            top: _isMapSmall ? _mapPosition.dy : 0,
            width: _isMapSmall ? 100 : MediaQuery.of(context).size.width,
            height: _isMapSmall ? 100 : MediaQuery.of(context).size.height,
            child: GestureDetector(
                onTap: _toggleMapSize,
                child: _isMapSmall
                    ? Draggable(
                        feedback: const LoadingRoutesScreen(),
                        childWhenDragging: Container(),
                        onDragEnd: (details) {
                          setState(() {
                            _mapPosition = details.offset;
                          });
                        },
                        child: const LoadingRoutesScreen(),
                      )
                    : const LoadingRoutesScreen()),
          ),
        ],
      ),
    );
  }
}
