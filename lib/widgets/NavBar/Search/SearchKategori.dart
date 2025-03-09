import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../TextField.dart';
import '../homeScreen/lists/kategoriList.dart';

class SearchKategori extends StatefulWidget {
  const SearchKategori({super.key});

  @override
  State<SearchKategori> createState() => _SearchKategoriState();
}

class _SearchKategoriState extends State<SearchKategori> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 66, left: 20, right: 20),
        child: Column(
          children: [
            TextFields(
              controller: searchController,
              hintText: 'Cari Skillmu disini',
              obscureText: false,
              color: Colors.transparent,
              borderColor: Color(0xFF4D86CD),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                ),
                itemCount: kategoriList.length,
                itemBuilder: (context, index) {
                  final kategori = kategoriList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, right: 10),
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Handle tap
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // Center the content vertically
                            children: [
                              Image.asset(
                                kategori.iconPath,
                                width: 15,
                                height: 21,
                              ),
                              const SizedBox(width: 8),
                              Text(kategori.name),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}