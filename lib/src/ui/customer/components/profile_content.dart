import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_palette.dart';
import '../../../core/models/bamba_service.dart';
import '../../../core/models/bamba_user.dart';
import '../../../core/utils/utils.dart';
import '../../kommons/shared_widgets.dart';
import 'service_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key? key,
    required this.bambaUser,
    required this.services,
    required this.onCancelService,
  }) : super(key: key);

  final BambaUser? bambaUser;
  final List<BambaService>? services;
  final void Function(String serviceId)? onCancelService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorPalette.headerColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/logotipo.png',
                      width: 106,
                      height: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/avatar.png"),
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${bambaUser?.name}",
                    style: const TextStyle(
                      color: ColorPalette.dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${bambaUser == null ? 0 : Utils.getAge(bambaUser!.birthdate!)} años ",
                    style: const TextStyle(
                      color: ColorPalette.dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Mis servicios contratados",
                style: TextStyle(
                  color: ColorPalette.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(onPressed: () {
              if (onCancelService != null) {
                onCancelService!("Id de prueba");
              }
            }, child: Text("Editar perfil"),),
            SharedWidgets.drawLineContainer(
                context, const EdgeInsets.symmetric(vertical: 12)),
            if (services != null)
              for (var bambaService in services!)
                Column(
                  children: [
                    ServiceCard(
                      bambaService: bambaService,
                      onCancelService: onCancelService,
                    ),
                    SharedWidgets.drawLineContainer(
                        context, const EdgeInsets.symmetric(vertical: 12)),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
