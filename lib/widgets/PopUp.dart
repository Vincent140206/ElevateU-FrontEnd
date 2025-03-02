import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String imagePath;
  final String deskripsi;

  const PopUp({
    super.key,
    required this.imagePath,
    required this.deskripsi,
  });

  static Future<void> show(BuildContext context, {required String imagePath, required String deskripsi}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            width: 272,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 206,
                  width: 205,
                ),
                const SizedBox(height: 9),
                const Text(
                  'Selamat!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  deskripsi,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff007BFF),
                  ),
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}