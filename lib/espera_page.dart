import 'package:flutter/material.dart';
import 'dart:async';
import 'inicio_page.dart';

class PantallaEspera extends StatefulWidget {
  const PantallaEspera({super.key});

  @override
  State<PantallaEspera> createState() => _PantallaEsperaState();
}

class _PantallaEsperaState extends State<PantallaEspera> {
  double _progreso = 0.0;
  bool _completado = false;

  @override
  void initState() {
    super.initState();
    _iniciarCarga();
  }

  void _iniciarCarga() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (mounted) {
        setState(() {
          if (_progreso < 1.0) {
            _progreso += 0.02;
          } else {
            _completado = true;
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- FONDO AZUL VIBRANTE / ELÉCTRICO ---
      backgroundColor: const Color(0xFF007BFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- IMAGEN AGRANDADA Y SIN SOMBRAS/FONDO ---
            Image.network(
              'https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/logotipo.png',
              height: 280, // Aumentado de 180 a 280
              fit: BoxFit.contain,
            ),
            
            const SizedBox(height: 30),

            // --- BARRA DE ESPERA BLANCA ---
            if (!_completado)
              Column(
                children: [
                  SizedBox(
                    width: 280, // Un poco más ancha para que coincida con la imagen
                    child: LinearProgressIndicator(
                      value: _progreso,
                      backgroundColor: Colors.white24, 
                      color: Colors.white, 
                      minHeight: 12, // Un poco más gruesa para que se vea mejor
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Cargando...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            else
              // --- BOTÓN INICIAR ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF007BFF), 
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PantallaInicio(),
                    ),
                  );
                },
                child: const Text(
                  "INICIAR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
