// Lokasi file: lib/widgets/auto_hiding_faq_button.dart

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_pkl/screens/faq_screen.dart'; // Pastikan import FaqScreen

class AutoHidingFaqButton extends StatefulWidget {
  final ScrollController scrollController;

  const AutoHidingFaqButton({
    super.key,
    required this.scrollController,
  });

  @override
  State<AutoHidingFaqButton> createState() => _AutoHidingFaqButtonState();
}

class _AutoHidingFaqButtonState extends State<AutoHidingFaqButton> {
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    // Gunakan scrollController yang dikirim dari halaman
    widget.scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isFabVisible) {
        setState(() => _isFabVisible = false);
      }
    } else {
      if (!_isFabVisible) {
        setState(() => _isFabVisible = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isFabVisible,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FaqScreen()),
          );
        },
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
        elevation: 4.0,
        tooltip: 'Bantuan (FAQ)',
        icon: const Icon(Icons.help_outline),
        label: const Text(
          'Bantuan',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
