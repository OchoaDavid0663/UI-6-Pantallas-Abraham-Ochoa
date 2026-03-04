import 'package:flutter/material.dart';
// IMPORTANTE: Asegúrate de que estos archivos existan en tu proyecto
import 'perfil_page.dart';
import 'ubicacion.dart';
import 'carrito.dart';
import 'configuracion.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  int _indiceActual = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool esCelular = constraints.maxWidth < 600;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              // SECCIÓN DE CATEGORÍAS CIRCULARES
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _itemCircular(Icons.medical_information, Colors.blue),
                        _itemCircular(Icons.sanitizer, Colors.pink),
                        _itemCircular(Icons.baby_changing_station, Colors.orange),
                        
                        if (esCelular) ...[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 25),
                          ),
                        ] else ...[
                          _itemCircular(Icons.biotech, Colors.purple),
                          _itemCircular(Icons.volunteer_activism, Colors.red),
                          _itemCircular(Icons.fitness_center, Colors.green),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              // BANNER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/banner.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                ),
              ),

              _seccionTitulo("Ver novedades➜", color: Colors.black),
              _listaHorizontalProductos([
                _cardProducto("Peluche Dr. Simi", "\$89.00", "https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/peluche.jpg"),
                _cardProducto("Pastillero", "\$25.00", "https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/PASTILLERO.jpg"),
              ]),

              _seccionTitulo("Ver medicamentos➜", color: Colors.black),
              _listaHorizontalProductos([
                _cardProducto("Simifibra", "\$15.00", "https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/SIMIFIBRA.jpg"),
                _cardProducto("Loratadina", "\$38.00", "https://raw.githubusercontent.com/OchoaDavid0663/Actividad12-3Paginas-Abraham-Ochoa-6-I/refs/heads/main/LORATADINA.jpg"),
              ]),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      );
    });
  }

  // Métodos de ayuda para la UI
  Widget _itemCircular(IconData icono, Color colorFondo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: colorFondo,
        child: Icon(icono, color: Colors.black, size: 28),
      ),
    );
  }

  Widget _seccionTitulo(String titulo, {Color color = Colors.blueAccent}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 18)),
    );
  }

  Widget _listaHorizontalProductos(List<Widget> productos) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        children: productos,
      ),
    );
  }

  Widget _cardProducto(String nombre, String precio, String urlImagen) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  urlImagen,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
          ),
          Text(nombre, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(precio, style: const TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // LÓGICA DE NAVEGACIÓN ACTUALIZADA
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _indiceActual,
      onTap: (index) {
        setState(() => _indiceActual = index);

        switch (index) {
          case 0:
            // Ya estamos en Inicio
            break;
          case 1:
            _navegarA(const PantallaUbicacion());
            break;
          case 2:
            _navegarA(const PantallaPerfil());
            break;
          case 3:
            _navegarA(const PantallaCarrito());
            break;
          case 4:
            _navegarA(const PantallaConfiguracion());
            break;
        }
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

  // Función genérica para navegar y resetear el índice al volver
  void _navegarA(Widget pagina) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pagina),
    ).then((_) {
      // Al regresar a la pantalla de inicio, volvemos a marcar el icono de "Inicio"
      setState(() => _indiceActual = 0);
    });
  }
}