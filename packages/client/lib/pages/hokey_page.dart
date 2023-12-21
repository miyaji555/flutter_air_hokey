import 'package:air_hokey_client/app_router.dart';
import 'package:air_hokey_client/game/air_hokey.dart';
import 'package:air_hokey_client/provider/is_debug_proivder.dart';
import 'package:air_hokey_client/widget/dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HokeyPage extends ConsumerWidget {
  const HokeyPage({@PathParam('id') required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDebug = ref.watch(isDebugProvider);
    void showExitDialog() {
      showDialog(
          context: context,
          builder: (context) => ExitRoomDialog(
                onTapYes: () {
                  AutoRouter.of(context).replaceAll([TopRoute()]);
                },
              ));
    }

    final game = AirHokey(
      isDebug: isDebug,
      id: id,
      showDialog: showExitDialog,
    );

    return SafeArea(
      child: GameWidget(
        game: game,
      ),
    );
  }
}
