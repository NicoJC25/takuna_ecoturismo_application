import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takuna_ecoturismo_application/presentation/markers/markers.dart';

Future<BitmapDescriptor> getStartCustomMarker(String minutes) async {
  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas(recoder);
  const size = ui.Size(200, 125);

  final startMarker = StartMarkerPainter(minutes: minutes);
  startMarker.paint(canvas, size);

  final picture = recoder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}

Future<BitmapDescriptor> getEndCustomMarker(String kilometers) async {
  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas(recoder);
  const size = ui.Size(200, 225);

  final startMarker = EndMarkerPainter(kilometers: kilometers);
  startMarker.paint(canvas, size);

  final picture = recoder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}
