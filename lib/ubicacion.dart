import 'package:flutter/material.dart';

// --- IMPORTANTE: Revisa que estos nombres de archivo sean EXACTOS a los tuyos ---
import 'inicio_page.dart'; // <--- Si tu archivo se llama inicio.dart, cambia esto
import 'perfil_page.dart';
import 'carrito.dart';
import 'configuracion.dart';

class PantallaUbicacion extends StatefulWidget {
  const PantallaUbicacion({super.key});

  @override
  State<PantallaUbicacion> createState() => _PantallaUbicacionState();
}

class _PantallaUbicacionState extends State<PantallaUbicacion> {
  int _indiceActual = 1;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _itemSucursal(
              'https://raw.githubusercontent.com/OchoaDavid0663/UI-6-Pantallas-Abraham-Ochoa/refs/heads/main/Suc_palaciomitla.png',
              "Sucursal Durango",
              "Abierto las 24 horas. Contamos con consultorio médico gratuito."
            ),
            _itemSucursal(
              'https://raw.githubusercontent.com/OchoaDavid0663/UI-6-Pantallas-Abraham-Ochoa/refs/heads/main/Suc_ramacoi.png',
              "Sucursal Ramacoi",
              "Ubicada en Plaza Ramacoi. Gran surtido en artículos de higiene."
            ),
            _itemSucursal(
              'https://raw.githubusercontent.com/OchoaDavid0663/UI-6-Pantallas-Abraham-Ochoa/refs/heads/main/Suc_ramonrayon.png',
              "Sucursal Ramon Rayon",
              "Cerca de Plaza las Torres. Servicio a domicilio rápido."
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _itemSucursal(String url, String nombre, String descripcion) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              url,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200, color: Colors.grey[300], child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(descripcion, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const Divider(height: 30),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _indiceActual,
      onTap: (index) {
        if (index == _indiceActual) return;

        // Quitamos los 'const' de aquí para evitar errores de compilación
        Widget destino;
        switch (index) {
          case 0: destino = PantallaInicio(); break; 
          case 1: return;
          case 2: destino = PantallaPerfil(); break;
          case 3: destino = PantallaCarrito(); break;
          case 4: destino = PantallaConfiguracion(); break;
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