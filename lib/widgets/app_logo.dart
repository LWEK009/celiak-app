import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AppLogo({super.key, this.size = 100, this.showText = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.grass, size: size * 0.6, color: Colors.green),
              Positioned(
                right: size * 0.2,
                top: size * 0.2,
                child: Icon(
                  Icons.close,
                  size: size * 0.3,
                  color: Colors.red.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
        if (showText) ...[
          const SizedBox(height: 12),
          Text(
            'NoGlutin',
            style: TextStyle(
              fontSize: size * 0.3,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
              letterSpacing: 1.2,
            ),
          ),
          Text(
            'Algeria',
            style: TextStyle(
              fontSize: size * 0.15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              letterSpacing: 4,
            ),
          ),
        ],
      ],
    );
  }
}
