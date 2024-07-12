import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Funcionalidad del mapa pequeño
class DraggableSmallMapView extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  final VoidCallback onTap;

  const DraggableSmallMapView({
    super.key,
    required this.initialLocation,
    required this.polylines,
    required this.markers,
    required this.onTap,
  });

  @override
  _DraggableSmallMapViewState createState() => _DraggableSmallMapViewState();
}

class _DraggableSmallMapViewState extends State<DraggableSmallMapView> {
  Offset position = Offset(50, 50);

  @override
  Widget build(BuildContext context) {
    //Poisicionamiento del mapa pequeño en pantalla de usuario
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position = Offset(
                position.dx + details.delta.dx, position.dy + details.delta.dy);
          });
        },
        child: Stack(
          children: [
            //Declaracion de como se vera el mapa pequeño
            Container(
              width: 150,
              height: 150,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: widget.initialLocation,
                  zoom: 14.4746,
                ),
                polylines: widget.polylines,
                markers: widget.markers,
              ),
            ),
            //Posicionamiento del boton para hacer el mapa grande de nuevo
            Positioned(
              top: 5,
              left: 5,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                onPressed: widget.onTap,
                child:
                    const Icon(Icons.fullscreen, size: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
