import 'package:flutter/material.dart';
// IMPORTANTE: Asegúrate de importar el archivo donde guardaste la Pantalla de Espera
import 'espera_page.dart'; 
import 'inicio_page.dart';
import 'perfil_page.dart';
import 'ubicacion.dart';      
import 'carrito.dart';        
import 'configuracion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Similares App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF03346E),
      ),
      // --- CAMBIO CLAVE: La ruta inicial ahora es la de espera ---
      initialRoute: '/espera', 
      routes: {
        '/espera': (context) => const PantallaEspera(),
        '/': (context) => const PantallaInicio(),
        '/perfil': (context) => const PantallaPerfil(),
        '/ubicacion': (context) => const PantallaUbicacion(),
        '/carrito': (context) => const PantallaCarrito(),
        '/configuracion': (context) => const PantallaConfiguracion(),
      },
    );
  }
}