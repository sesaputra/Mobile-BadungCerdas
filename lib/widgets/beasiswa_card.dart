// Lokasi file: lib/widgets/beasiswa_card.dart

import 'package:flutter/material.dart';

class BeasiswaCard extends StatelessWidget {
  final String judul;
  final String nominal;
  final String tanggal;
  final String posterPath;

  const BeasiswaCard({
    super.key,
    required this.judul,
    required this.nominal,
    required this.tanggal,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dekorasi Card
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08), // Bayangan halus
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200), // Garis tepi tipis
      ),
      // Memastikan konten di dalamnya mengikuti border radius
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Gambar Poster
            Image.asset(
              posterPath,
              height: 150, // Tinggi gambar yang konsisten
              fit: BoxFit.cover,
              // Penanganan jika gambar gagal dimuat
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey.shade500,
                      size: 50,
                    ),
                  ),
                );
              },
            ),

            // 2. Area Teks Detail
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Beasiswa
                  Text(
                    judul,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),

                  // Detail Tanggal
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 14, color: Colors.grey.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'Batas Pendaftaran: $tanggal',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Detail Nominal
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined,
                          size: 14, color: Colors.grey.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'Nominal: $nominal',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),

                  // --- 🔥 TOMBOL "LIHAT DETAIL" SUDAH DIHAPUS DARI SINI ---
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
