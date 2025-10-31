import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class DragLiquidGlass extends StatefulWidget {
  @override
  State<DragLiquidGlass> createState() => _DragLiquidGlassState();
}

class _DragLiquidGlassState extends State<DragLiquidGlass> {
  Offset position = const Offset(50, 550);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset('lib/assets/download.jpg', fit: BoxFit.cover),
          ),

          // Draggable LiquidGlass
          Center(
            child: Positioned(
              child: LiquidGlass.withOwnLayer(
                settings: LiquidGlassSettings(
                  thickness: 40.0,
                  blur: 20.0,
                  lightAngle: 0.0,
                  glassColor: const Color.fromARGB(30, 145, 125, 125),
                ),
                shape: LiquidRoundedSuperellipse(borderRadius: 25.0),
                child: const SizedBox(width: 300, height: 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
