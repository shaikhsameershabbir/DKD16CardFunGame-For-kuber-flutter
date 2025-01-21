import 'package:flutter/material.dart';
import 'package:kuber/screens/dus_ka_dam_screen.dart';
import 'package:kuber/widgets/animated_button.dart';
import 'package:kuber/widgets/settings_card.dart';

class GameOptions extends StatefulWidget {
  const GameOptions({super.key});

  @override
  State<GameOptions> createState() => _GameOptionsState();
}

class _GameOptionsState extends State<GameOptions> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/bg/game_option_bg.png"))),
        ),
        Positioned(
          top: 150,
          child: Container(
            width: width,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(buttonText: "Card Game", onTap: () {}),
                SizedBox(
                  width: 20,
                ),
                AnimatedButton(
                    buttonText: "Dus Ka Dam",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DusKaDamScreen()));
                    }),
                SizedBox(
                  width: 20,
                ),
                AnimatedButton(buttonText: "Fun Game", onTap: () {}),
              ],
            ),
          ),
        ),
        Positioned(
            // bottom: 0,
            top: 250,
            child: SizedBox(
              width: width,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      SettingsCard(
                        icon: Icons.person_outline,
                        title: 'Account',
                        subtitle: 'Personal information, email',
                        color: const Color(0xFF6C5CE7),
                        onTap: () {
                          // Handle account tap
                        },
                      ),
                      SettingsCard(
                        icon: Icons.lock_outline,
                        title: 'Change Password',
                        subtitle: 'Change your password',
                        color: const Color(0xFF00B894),
                        onTap: () {
                          // Handle password change tap
                        },
                      ),
                      SettingsCard(
                        icon: Icons.exit_to_app,
                        title: 'Close',
                        subtitle: 'Exit the application',
                        color: const Color(0xFFFF7675),
                        onTap: () {
                          // Handle close tap
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            ))
      ],
    );
  }
}
