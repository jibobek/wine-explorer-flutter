import 'package:flutter/material.dart';
import 'package:wine_explorer/constants/color_constants.dart';

class HomeTileComponent extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const HomeTileComponent(
      {Key? key, required this.label, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.35,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor,
                  blurRadius: 0.0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      icon,
                      size: MediaQuery.of(context).size.width * 0.2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
