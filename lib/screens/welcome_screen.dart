import 'package:flutter/material.dart';
// Ganti 'project_pkl' dengan nama folder project Anda
import 'package:project_pkl/screens/login_screen.dart';
import 'package:project_pkl/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.orange.shade800;
    // Ambil ukuran layar
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // 1. Background utama diatur ke putih
      backgroundColor: const Color(0xFFF7F9FC),
      body: Stack(
        children: [
          // --- WIDGET 1: BACKGROUND ATAS (GAMBAR MELENGKUNG) ---
          Container(
            // Mengatur tinggi 70% dari layar
            height: screenSize.height * 0.6,
            decoration: const BoxDecoration(
              // Tepian bawah dibuat melengkung
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40.0),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/background_floral.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
          ),

          // --- WIDGET 2: KONTEN UTAMA (TUMPANG TINDIH) ---
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- Bagian Atas 70% (Teks & Logo) ---
                Expanded(
                  flex: 6, // 70%
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'SELAMAT DATANG DI\nBADUNG CERDAS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600, // Semi-bold
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'SISTEM BEASISWA KABUPATEN BADUNG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Image.asset(
                          'assets/images/logo_badung.png',
                          height: 120, // Atur ukuran logo
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'DINAS KOMUNIKASI DAN\n INFORMATIKA\nKABUPATEN BADUNG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500, // Medium
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- Bagian Bawah 30% (Tombol) ---
                Expanded(
                  flex: 4, // 30%
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      // Mengatur tombol di tengah area putih
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: buttonColor,
                              side: BorderSide(color: buttonColor, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // TODO: Ganti ini ke halaman Register nanti
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: buttonColor,
                              side: BorderSide(color: buttonColor, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
