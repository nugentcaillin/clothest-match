import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class Onboarding extends StatefulWidget
{
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin{

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 20,
    spawnMaxRadius: 20.0,
    spawnMaxSpeed: 30,
    spawnMinSpeed: 20,
    spawnMinRadius: 7.0,
  );

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child:
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 281.14,
                  left: 60,
                  right: 59.24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 273.76,
                      child: Text(
                        'Welcome to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF69819C),
                          fontSize: 29.56,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 176.14,
                        child: Image(image: AssetImage('assets/logo.png'))
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );

  }
}