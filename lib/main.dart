// main.dart

import 'package:examen_movil/Login/Login_screen.dart';
import 'package:examen_movil/compras/pages/compras_pages.dart';
import 'package:examen_movil/sebastian/dashboard.dart';
import 'package:examen_movil/yorman/ventas/components/header.dart';
import 'package:examen_movil/yorman/ventas/components/menu.dart';
import 'package:examen_movil/yorman/ventas/components/venta_card.dart';
import 'package:examen_movil/yorman/ventas/pages/ventas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home':  (context) => const AppShell(),
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  MenuTab _tabActivo = MenuTab.inicio;

  final List<VentaModel> _ventas = const [
    VentaModel(
      numeroVenta: '382749105',
      estado: EstadoVenta.aprobada,
      cliente: 'Diana Patricia Herrera Ríos',
      fecha: '05/01/2025',
      metodoPago: 'Efectivo',
      total: 37842,
    ),
    VentaModel(
      numeroVenta: '519203847',
      estado: EstadoVenta.aprobada,
      cliente: 'Sebastián Felipe Agudelo Torres',
      vendedor: 'Carlos Andrés Muñoz',
      fecha: '10/01/2025',
      metodoPago: 'Transferencia',
      total: 173145,
    ),
    VentaModel(
      numeroVenta: '293847561',
      estado: EstadoVenta.anulada,
      cliente: 'Valentina Morales Fuentes',
      vendedor: 'Laura Milena Restrepo',
      fecha: '20/01/2025',
      metodoPago: 'Efectivo',
      total: 28322,
    ),
    VentaModel(
      numeroVenta: '847392015',
      estado: EstadoVenta.espAprobacion,
      cliente: 'Miguel Ángel Pérez Castañeda',
      vendedor: 'Isabella Chen Rodríguez',
      fecha: '25/01/2025',
      metodoPago: 'Transferencia',
      total: 243236,
    ),
    VentaModel(
      numeroVenta: '560294817',
      estado: EstadoVenta.desaprobada,
      cliente: 'Santiago Alejandro Ruiz Patiño',
      vendedor: 'Usuario eliminado',
      fecha: '07/02/2025',
      metodoPago: 'Crédito',
      total: 88298,
    ),
  ];

  final List<CompraModel> _compras = const [
    CompraModel(
      proveedor: 'Papelería el punto escolar',
      nroFactura: '12345455',
      cantidadProductos: '8',
      fecha: '05/03/2025',
      total: '\$ 1.000.000',
      completada: true,
    ),
    CompraModel(
      proveedor: 'Ofiexpress Ltda.',
      nroFactura: '765432111',
      cantidadProductos: '5',
      fecha: '05/02/2025',
      total: '\$ 300.000',
      completada: false,
    ),
    CompraModel(
      proveedor: 'Papelería el punto escolar',
      nroFactura: '12345421',
      cantidadProductos: '8',
      fecha: '05/01/2025',
      total: '\$ 1.000.000',
      completada: true,
    ),
    CompraModel(
      proveedor: 'Arte color suppliers',
      nroFactura: '92395421',
      cantidadProductos: '9',
      fecha: '05/01/2025',
      total: '\$ 3.000.000',
      completada: false,
    ),
  ];

  Widget _buildBody() {
    switch (_tabActivo) {
      case MenuTab.inicio:
        return const DashboardScreen();
      case MenuTab.ventas:
        return VentasPage(ventas: _ventas);
      case MenuTab.compras:
        return ComprasPage(compras: _compras);
      case MenuTab.ajustes:
        return const _PlaceholderView(label: 'AJUSTES');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            VentasHeader(
              nombreUsuario: 'Sebastian B',
              rol: 'Administrador',
              onSearch: () {},
              onNotifications: () {},
            ),
            Expanded(child: _buildBody()),
            VentasMenu(
              tabActivo: _tabActivo,
              onTabSeleccionado: (tab) {
                setState(() => _tabActivo = tab);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderView extends StatelessWidget {
  final String label;
  const _PlaceholderView({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF9E9E9E),
        ),
      ),
    );
  }
}