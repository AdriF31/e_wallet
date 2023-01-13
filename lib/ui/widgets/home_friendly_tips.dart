import 'package:flutter/material.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFriendlyTips extends StatelessWidget {
  final String image;
  final String tips;
  final Uri url;

  const HomeFriendlyTips(
      {Key? key, required this.image, required this.tips, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        if (await launchUrl(url)) {
          launchUrl(url);
        }
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          width: mediaQuery.width * 0.4,
          height: mediaQuery.height * 0.24,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                tips,
                style: blackTextStyle.copyWith(fontWeight: medium),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
