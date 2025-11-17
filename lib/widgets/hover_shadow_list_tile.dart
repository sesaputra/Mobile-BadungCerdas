// file: lib/widgets/hover_shadow_list_tile.dart

import 'package:flutter/material.dart';

class HoverShadowListTile extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor; // Untuk kustomisasi warna ikon
  final Color? textColor; // Untuk kustomisasi warna teks

  const HoverShadowListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  State<HoverShadowListTile> createState() => _HoverShadowListTileState();
}

class _HoverShadowListTileState extends State<HoverShadowListTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: Card(
        // Atur shadow (elevation) berdasarkan state _isHovering
        elevation: _isHovering ? 8.0 : 0.0,
        // Durasi animasi saat elevation berubah
        shadowColor: Colors.black.withOpacity(0.4), // Warna shadow
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          // Menggunakan InkWell untuk efek ripple saat diklik
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            // Menambahkan padding di dalam InkWell
            padding: const EdgeInsets.symmetric(
                vertical:
                    8.0), // Sesuaikan padding agar terlihat seperti ListTile
            child: Row(
              children: [
                const SizedBox(width: 16.0), // Padding awal untuk ikon
                Icon(
                  widget.leadingIcon,
                  color: widget.iconColor ?? Colors.grey.shade700,
                ),
                const SizedBox(width: 32.0), // Jarak antara ikon dan teks
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.textColor ?? Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
