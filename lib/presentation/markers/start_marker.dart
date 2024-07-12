import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Creacion de la parte visual del marcador de inicio
class StartMarkerPainter extends CustomPainter {
  final String minutes;

  StartMarkerPainter({required this.minutes});

  @override
  void paint(Canvas canvas, Size size) {
    final greenPaint = Paint()..color = const Color.fromARGB(255, 153, 204, 51);
    final whitePaint = Paint()..color = Colors.white;

    const double circleGreenRadius = 10;
    const double circleWhiteRadius = 4.5;

    // Circulo verde
    canvas.drawCircle(const Offset(100, 115), circleGreenRadius, greenPaint);

    // Circulo Blanco
    canvas.drawCircle(const Offset(100, 115), circleWhiteRadius, whitePaint);

    //Caja blanca
    const whiteBox = Rect.fromLTWH(17, 55, 68, 50);
    final rrect = RRect.fromRectAndRadius(whiteBox, const Radius.circular(10));

    //Dibujo de caja blanca
    final path = Path()..addRRect(rrect);
    canvas.drawPath(path, whitePaint);

    //Texto minutos
    final textSpan = TextSpan(
        style: const TextStyle(
            color: Color.fromARGB(255, 153, 204, 51),
            fontSize: 10,
            fontFamily: 'RadioATreqer'),
        text: '$minutes MIN');

    //Ajuste de texto minutos
    final minutesPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: 40, maxWidth: 55);

    //Dibujo de texto minutos
    minutesPainter.paint(canvas, const Offset(31, 68));

    //Texto tiempo
    final minutesText = TextSpan(
        style: TextStyle(
            color: const Color.fromARGB(255, 101, 68, 36),
            fontSize: 10,
            fontFamily: GoogleFonts.redHatDisplay().fontFamily),
        text: 'Tiempo');

    //Ajuste de texto tiempo
    final minutesMinPainter = TextPainter(
        text: minutesText,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: 40, maxWidth: 100);

    //Dibujo de texto tiempo
    minutesMinPainter.paint(canvas, const Offset(31, 82));
  }

  //Configuraciones adicionales
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
