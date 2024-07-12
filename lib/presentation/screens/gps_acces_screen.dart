import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takuna_ecoturismo_application/blocs/blocs.dart';

//Pantalla acceso gps y ubicacion
class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
                ? const _EnableGpsMessage()
                : const _AccesButton();
          },
        ),
      ),
    );
  }
}

//Boton de acceso gps
class _AccesButton extends StatelessWidget {
  const _AccesButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            """¡Es necesario acceso a la ubicacion, Senderista!""",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GoogleFonts.redHatDisplay().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        MaterialButton(
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          child: const Text(
            'Solicitar acceso',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

//Mensaje de encender gps
class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '¡Debes habilitar el GPS, Senderista!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.redHatDisplay().fontFamily),
      ),
    );
  }
}
