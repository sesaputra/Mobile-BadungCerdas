import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project_pkl/screens/register_screen.dart';
import 'package:project_pkl/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.orange.shade800;
    final screenSize = MediaQuery.of(context).size;

    // Ini adalah style untuk TextField
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 2,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Stack(
        children: [
          // --- WIDGET 1: BACKGROUND ATAS (GAMBAR MELENGKUNG) ---
          Container(
            // Kita buat sedikit lebih kecil dari 50%
            height: screenSize.height * 0.45,
            decoration: const BoxDecoration(
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

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 45, // Sesuaikan dengan tinggi background (45%)
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hapus "Selamat Datang" agar tidak terlalu ramai
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
                          height: 100, // Sedikit lebih kecil
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'DINAS KOMUNIKASI DAN\n INFORMATIKA\nKABUPATEN BADUNG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 55, // Sisa 55%
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    // Kita gunakan SingleChildScrollView agar
                    // form tidak error saat keyboard muncul
                    child: SingleChildScrollView(
                      child: Column(
                        // Rata kiri untuk form
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24), // Jarak dari lengkungan
                          // --- Judul LOGIN ---
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // --- Field Email ---
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'masukkan email Anda',
                              border: inputBorder,
                              enabledBorder: inputBorder,
                              focusedBorder: inputBorder,
                              filled: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 16),
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // --- Field Password ---
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            obscureText: true, // Untuk menyembunyikan password
                            decoration: InputDecoration(
                              hintText: 'masukkan password Anda',
                              border: inputBorder,
                              enabledBorder: inputBorder,
                              focusedBorder: inputBorder,
                              filled: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 16),
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // --- Tombol Masuk & Lupa Password ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Tombol MASUK (Filled Button)
                              ElevatedButton(
                                onPressed: () {
                                  // Navigasi ke Halaman Utama (Home)
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                ),
                                child: const Text(
                                  'MASUK',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),

                              // Link Lupa Password
                              TextButton(
                                onPressed: () {
                                  // TODO: Buat halaman Lupa Password
                                },
                                child: Text(
                                  'Lupa Password?',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // --- Link Buat Akun ---
                          // Menggunakan RichText agar bisa beda warna
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade800,
                                fontFamily: 'Poppins', // Sesuaikan font Anda
                              ),
                              children: [
                                const TextSpan(text: 'Belum mempunyai akun? '),
                                TextSpan(
                                  text: 'Buat akun baru',
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigasi ke halaman Register
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
