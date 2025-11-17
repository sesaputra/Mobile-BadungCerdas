// file: lib/widgets/hover_pill_list_tile.dart

import 'package:flutter/material.dart';

class HoverPillListTile extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;
  final Color? defaultIconColor;
  final Color? defaultTextColor;
  final Color hoverColor; // Warna utama (mis: oranye)

  const HoverPillListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.defaultIconColor,
    this.defaultTextColor,
    this.hoverColor = Colors.orange, // Default ke oranye
  }) : super(key: key);

  @override
  State<HoverPillListTile> createState() => _HoverPillListTileState();
}

class _HoverPillListTileState extends State<HoverPillListTile> {
  bool _isHovering = false;
  
  @override
  Widget build(BuildContext context) {
    
    // --- 🔥 PERUBAHAN DI SINI ---
    
    // 1. Buat warna gelap secara manual dari hoverColor
    final HSLColor hsl = HSLColor.fromColor(widget.hoverColor);
    // 2. Gelapkan warnanya (kurangi lightness). 
    //    Kita buat 30% lebih gelap, tapi 'clamp' agar nilainya tidak di bawah 0.
    final HSLColor darkerHsl = hsl.withLightness((hsl.lightness - 0.3).clamp(0.0, 1.0)); 
    final Color darkerHoverColor = darkerHsl.toColor();

    // Tentukan warna berdasarkan state hover
    final Color iconColor = _isHovering
        ? darkerHoverColor // <-- FIX: Gunakan warna yang sudah digelapkan
        : widget.defaultIconColor ?? Colors.grey.shade700;
        
    final Color textColor = _isHovering
        ? darkerHoverColor // <-- FIX: Gunakan warna yang sudah digelapkan
        : widget.defaultTextColor ?? Colors.grey.shade800;
        
    final Color backgroundColor = _isHovering
        ? widget.hoverColor.withOpacity(0.1) // Latar belakang tetap terang
        : Colors.transparent;

    // --- AKHIR PERUBAHAN ---

    return Padding(
      // Beri jarak antar item
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // Durasi animasi
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30.0), // Bentuk pil
          ),
          child: ListTile(
            leading: Icon(widget.leadingIcon, color: iconColor),
            title: Text(
              widget.title,
              style: TextStyle(
                color: textColor, 
                fontWeight: _isHovering ? FontWeight.w600 : FontWeight.normal
              ),
            ),
            onTap: widget.onTap,
            hoverColor: Colors.transparent, // Matikan hover default ListTile
            splashColor: widget.hoverColor.withOpacity(0.2), // Efek klik
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}