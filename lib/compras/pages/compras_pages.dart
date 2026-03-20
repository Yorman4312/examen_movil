import 'package:flutter/material.dart';
import '../components/compra_card.dart';
import '../components/header.dart';
import '../components/menu.dart';

class ComprasPages extends StatelessWidget {
  const ComprasPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──
          const Header(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              children: [
                // ── Título ──
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'COMPRAS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1C1C1E),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ── Buscador ──
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD1D1D6)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          child: Text(
                            'Buscar',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFAEAEB2),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF1C1C1E),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── Tarjeta 1: COMPLETADA ──
                const CompraCard(
                  proveedor: 'Papelería el punto escolar',
                  nroFactura: '12345455',
                  cantidadProductos: '8',
                  fecha: '05/03/2025',
                  total: '\$ 1.000.000',
                  completada: true,
                ),

                // ── Tarjeta 2: ANULADA ──
                const CompraCard(
                  proveedor: 'Ofiexpress Ltda.',
                  nroFactura: '765432111',
                  cantidadProductos: '5',
                  fecha: '05/02/2025',
                  total: '\$ 300.000',
                  completada: false,
                ),

                // ── Tarjeta 3: COMPLETADA ──
                const CompraCard(
                  proveedor: 'Papelería el punto escolar',
                  nroFactura: '12345421',
                  cantidadProductos: '8',
                  fecha: '05/01/2025',
                  total: '\$ 1.000.000',
                  completada: true,
                ),

                // ── Tarjeta 4: ANULADA ──
                const CompraCard(
                  proveedor: 'Arte color suppliers',
                  nroFactura: '92395421',
                  cantidadProductos: '9',
                  fecha: '05/01/2025',
                  total: '\$ 3.000.000',
                  completada: false,
                ),

                const SizedBox(height: 12),

                // ── Botón Ver Más ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B3A6B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Ver Más...',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ── Menú inferior ──
      bottomNavigationBar: const Menu(currentIndex: 2),
    );
  }
}