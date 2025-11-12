import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';
import '../widgets/section_title_with_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        "assets/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Hello, I\'m Akshay',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                portfolioData["tagline"]!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SectionTitleWithContent(
                title: 'Professional Summary',
                child: Text(
                  portfolioData["professionalSummary"]!,
                  style: GoogleFonts.poppins(color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FlutterSocialButton(
                        mini: true,
                        buttonType: ButtonType.linkedin,
                        onTap: () =>
                            _launchURL(portfolioData["contact"]["linkedin"]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  // SizedBox(
                  //   height: 48,
                  //   width: 48,
                  //   child: FittedBox(
                  //     fit: BoxFit.scaleDown,
                  //     child: FlutterSocialButton(
                  //       mini: true,
                  //       buttonType: ButtonType.github,
                  //       onTap: () =>
                  //           _launchURL(portfolioData["contact"]["github"]),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 18),
                  // SizedBox(
                  //   height: 48,
                  //   width: 48,
                  //   child: FittedBox(
                  //     fit: BoxFit.scaleDown,
                  //     child: CircleAvatar(
                  //       radius: 25,
                  //       backgroundColor: Colors.black38,
                  //       child: IconButton(
                  //         icon: const Icon(
                  //           FontAwesomeIcons.youtube,
                  //           color: Colors.red,
                  //         ),
                  //         onPressed: () =>
                  //             _launchURL(portfolioData["contact"]["youtube"]),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
