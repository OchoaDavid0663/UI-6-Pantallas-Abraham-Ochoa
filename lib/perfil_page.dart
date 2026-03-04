import 'package:flutter/material.dart';
// Asegúrate de que estos nombres de archivo coincidan con los tuyos
import 'inicio_page.dart';
import 'ubicacion.dart';
import 'carrito.dart';
import 'configuracion.dart';

class PantallaPerfil extends StatefulWidget {
  const PantallaPerfil({super.key});

  @override
  State<PantallaPerfil> createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  int _indiceActual = 2; // Índice fijo para Perfil
  final Color azulElectrico = const Color(0xFF007BFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Quitamos el botón de atrás manual para usar la barra de navegación
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: azulElectrico, width: 5),
                  image: const DecorationImage(
                    image: NetworkImage('https://raw.githubusercontent.com/OchoaDavid0663/IAMoviles-Act-9-una-pantalla-dise-o-6-I/refs/heads/main/Simi.png'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: azulElectrico.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _botonPerfil(Icons.login, "INICIAR SESION", const Color(0xFF1877F2)),
              _botonPerfil(Icons.person, "REGISTRARSE", const Color(0xFF1877F2)),
              _botonPerfil(Icons.person_outline, "EMPLEADO", const Color(0xFF1877F2)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // --- NUEVA LÓGICA DE NAVEGACIÓN ---
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _indiceActual,
      onTap: (index) {
        if (index == _indiceActual) return; // Si ya estamos aquí, no hacer nada

        Widget destino;
        switch (index) {
          case 0:
            destino = const PantallaInicio();
            break;
          case 1:
            destino = const PantallaUbicacion();
            break;
          case 2:
            return; // Ya estamos en Perfil
          case 3:
            destino = const PantallaCarrito();
            break;
          case 4:
            destino = const PantallaConfiguracion();
            break;
          default:
            return;
        }

        // Navegación limpia para menús principales
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => destino),
        );
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF03346E),
      selectedItemColor: Colors.lightBlueAccent,
      unselectedItemColor: Colors.white38,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Ubicación'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config.'),
      ],
    );
  }

  Widget _botonPerfil(IconData icono, String texto, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            shadowColor: color.withOpacity(0.4),
          ),
          icon: Icon(icono, size: 24),
          label: Text(texto, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          onPressed: () {},
        ),
      ),
    );
  }
}