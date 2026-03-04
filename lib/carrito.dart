import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'ubicacion.dart';
import 'perfil_page.dart';
import 'configuracion.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({super.key});

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  int _indiceActual = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF03346E),
        automaticallyImplyLeading: false,
        title: const Text("CARRITO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _itemCarrito(
                  "https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/peluche.jpg",
                  "Peluche Dr. Simi",
                  "\$179.99"
                ),
              ],
            ),
          ),
          
          // SECCIÓN DE TOTAL
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF03346E),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total:", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text("\$179.99", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _itemCarrito(String url, String nombre, String precio) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF03346E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text(precio, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),
                
                // FILA DE CONTROLES (Cantidad + Eliminar)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Selector de cantidad
                    Row(
                      children: [
                        _botonCantidad(Icons.remove),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text("1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        _botonCantidad(Icons.add),
                      ],
                    ),
                    // TACHITA PARA ELIMINAR (Lado derecho)
                    IconButton(
                      onPressed: () {
                        // Aquí iría la lógica para quitar del carrito
                      },
                      icon: const Icon(Icons.close, color: Colors.white, size: 24),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botonCantidad(IconData icono) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icono, color: Colors.white, size: 20),
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
          case 3: return; 
          case 4: destino = const PantallaConfiguracion(); break;
          default: return;
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => destino));
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