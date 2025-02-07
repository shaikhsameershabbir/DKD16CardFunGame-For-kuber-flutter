import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/card16game/screen/card16_game_home.dart';
import 'package:kuber/cubit/auth_cubit.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/main.dart';
import 'package:kuber/screens/dus_ka_dam_screen.dart';
import 'package:kuber/screens/login.dart';
import 'package:kuber/socket_serive/socket_service.dart';
import 'package:kuber/widgets/animated_button.dart';
import 'package:kuber/widgets/settings_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:intl/intl.dart';

import 'package:kuber/cubit/claimticket/claim_ticket_cubit.dart';
import 'package:kuber/cubit/cleardata/clear_data_cubit.dart';
import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_cubit.dart';
import 'package:kuber/cubit/cubit/timer_cubit.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_cubit.dart';
import 'package:kuber/cubit/drawtimecubit/draw_time_cubit.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_cubit.dart';
import 'package:kuber/cubit/password_change_cubit/password_change_cubit.dart';
import 'package:kuber/cubit/selectdatestate/from_and_to_date_state_cubit.dart';

////////////   below old working code ////////////////

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

    // print("balance geting");
    // context.read<BalanceUpdateCubit>().initializeBalanceSocket();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/bg/game_option_bg.jpg"))),
        ),
        Positioned(
          top: 150,
          child: Container(
            width: width,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                    buttonText: "Card Game",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Card16GameHome()));
                    }),
                SizedBox(
                  width: 20,
                ),
                AnimatedButton(
                    buttonText: "Dus Ka Dam",
                    onTap: () async {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DusKaDamScreen()));
                      } catch (e) {
                        print("error in 10 ka dum gameoption screen");
                      }
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
                        onTap: () async {},
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
                        onTap: () async {
                          try {
                            exit(0);
                          } catch (e) {
                            print("error while logout in gameoptions");
                          }
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
