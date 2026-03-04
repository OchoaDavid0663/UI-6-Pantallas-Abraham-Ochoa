import 'package:flutter/material.dart';
// Importaciones de tus archivos
import 'inicio_page.dart';
import 'ubicacion.dart';
import 'perfil_page.dart';
import 'carrito.dart';

class PantallaConfiguracion extends StatefulWidget {
  const PantallaConfiguracion({super.key});

  @override
  State<PantallaConfiguracion> createState() => _PantallaConfiguracionState();
}

class _PantallaConfiguracionState extends State<PantallaConfiguracion> {
  int _indiceActual = 4; // Índice para Configuración

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: const Color(0xFF03346E),
  automaticallyImplyLeading: false,
  // Aumentamos la altura del área azul (por defecto es 56)
  toolbarHeight: 80, 
  title: Container(
    // Hacemos la barra más delgada (de 40 a 30)
    height: 30, 
    margin: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15), // Bordes más ajustados al alto
    ),
    child: const TextField(
      decoration: InputDecoration(
        // Quitamos el texto (hintText) para que quede limpia
        hintText: "", 
        prefixIcon: Icon(Icons.search, color: Colors.blueGrey, size: 18),
        border: InputBorder.none,
        // Ajustamos el padding interno para que el cursor no se vea mal
        contentPadding: EdgeInsets.only(bottom: 12), 
      ),
    ),
  ),
),  
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
            child: Text(
              "Configuración",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF03346E),
              ),
            ),
          ),
          const Divider(thickness: 2, indent: 20, endIndent: 20),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _opcionConfiguracion(Icons.palette, "Estilo de la app"),
                _opcionConfiguracion(Icons.person, "Usuario"),
                _opcionConfiguracion(Icons.email, "Correo"),
                _opcionConfiguracion(Icons.lock, "Contraseña"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // Widget para las opciones con efecto de color al pasar el mouse (Hover)
  Widget _opcionConfiguracion(IconData icono, String titulo) {
    return InkWell(
      onTap: () {
        // Acción al presionar
      },
      // El color de resaltado (hoverColor) cambia cuando el mouse pasa por encima
      hoverColor: const Color(0xFF03346E).withOpacity(0.1),
      splashColor: const Color(0xFF03346E).withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icono, color: const Color(0xFF03346E), size: 28),
            const SizedBox(width: 20),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _indiceActual,
      onTap: (index) {
        if (index == _indiceActual) return;
        Widget destino;
        switch (index) {
          case 0: destino = const PantallaInicio(); break;
          case 1: destino = const PantallaUbicacion(); break;
          case 2: destino = const PantallaPerfil(); break;
          case 3: destino = const PantallaCarrito(); break;
          case 4: return; 
          default: return;
        }
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
}