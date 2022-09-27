import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/theme/theme_bloc.dart';
import '../../../core/models/services/bamba_service.dart';
import '../../../core/utils/utils.dart';

class ProfileServiceCardContent extends StatelessWidget {
  final BambaService bambaService;
  const ProfileServiceCardContent({
    Key? key,
    required this.bambaService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${bambaService.name}",
              style: TextStyle(
                color: state.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                "Vigencia al ${localizedDate(bambaService.validTo)}",
                style: TextStyle(
                  color: state.textSubTitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () => Utils.launchURL(bambaService.certificateLink!),
              child: Text(
                "Ver certificado",
                style: TextStyle(
                  color: state.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
              ),
            )
          ],
        );
      }));
  }

  String localizedDate(DateTime? dateTime) => Utils.getLocalizedDate(dateTime);
}
