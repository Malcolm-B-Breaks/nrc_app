import 'package:flutter/material.dart';

class PlaceholderImageHelper {
  static Widget buildPlaceholderImage(String productName, double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.computer,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              productName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 