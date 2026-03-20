// menu.dart

import 'package:flutter/material.dart';

enum MenuTab { inicio, ventas, compras, ajustes }

class VentasMenu extends StatelessWidget {
  final MenuTab tabActivo;
  final ValueChanged<MenuTab> onTabSeleccionado;

  const VentasMenu({
    super.key,
    required this.tabActivo,
    required this.onTabSeleccionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MenuItem(
            icon: Icons.home_rounded,
            label: 'INICIO',
            activo: tabActivo == MenuTab.inicio,
            onTap: () => onTabSeleccionado(MenuTab.inicio),
          ),
          _MenuItem(
            icon: Icons.show_chart_rounded,
            label: 'VENTAS',
            activo: tabActivo == MenuTab.ventas,
            onTap: () => onTabSeleccionado(MenuTab.ventas),
          ),
          _MenuItem(
            icon: Icons.shopping_bag_outlined,
            label: 'COMPRAS',
            activo: tabActivo == MenuTab.compras,
            onTap: () => onTabSeleccionado(MenuTab.compras),
          ),
          _MenuItem(
            icon: Icons.settings_outlined,
            label: 'AJUSTES',
            activo: tabActivo == MenuTab.ajustes,
            onTap: () => onTabSeleccionado(MenuTab.ajustes),
          ),
        ],
      ),
    );
  }
}

// — Ítem individual del menú
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool activo;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.activo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = activo ? const Color(0xFF1B4F72) : const Color(0xFF9E9E9E);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 26, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: activo ? FontWeight.w700 : FontWeight.w400,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}