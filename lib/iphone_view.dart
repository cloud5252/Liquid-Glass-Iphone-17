import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class DragLiquidGlass extends StatefulWidget {
  @override
  State<DragLiquidGlass> createState() => _DragLiquidGlassState();
}

class _DragLiquidGlassState extends State<DragLiquidGlass> {
  Offset position = const Offset(50, 200); // starting position

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen background image
          SizedBox.expand(
            child: Image.asset('lib/assets/download.jpg', fit: BoxFit.cover),
          ),

          // Draggable LiquidGlass
          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanUpdate: (details) {
                setState(() {
                  position += details.delta;
                });
              },
              child: LiquidGlass.withOwnLayer(
                settings: LiquidGlassSettings(
                  thickness: 40.0,
                  blur: 0,
                  // lightAngle: 0.0,
                  // lightIntensity: 5,
                  // ambientStrength: 10,
                  // refractiveIndex: 1.0,
                  // saturation: 2,
                  // visibility: 2,
                  chromaticAberration: 3,
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
