import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
    final contact = portfolioData["contact"] as Map<String, dynamic>;
    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get in Touch',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "I'm currently open to new opportunities. Let's connect!",
                style: GoogleFonts.poppins(color: Colors.grey.shade600),
              ),
              const Divider(color: Color(0xFF1434A4), thickness: 2),
              const SizedBox(height: 24),
              _buildContactCard(context, contact),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, Map<String, dynamic> contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactItem(
              context,
              icon: Icons.email,
              label: contact["email"],
              onTap: () => _launchURL("mailto:${contact["email"]}"),
            ),
            const Divider(),
            _buildContactItem(
              context,
              icon: Icons.phone,
              label: contact["phone"],
              onTap: () => _launchURL("tel:${contact["phone"]}"),
            ),
            const Divider(),
            _buildContactItem(
              context,
              icon: Icons.location_on,
              label: contact["location"],
            ),
            const Divider(),
            _buildContactItem(
              context,
              icon: Icons.calendar_today,
              label: "Born on: ${contact["dob"]}",
            ),
            const Divider(),
            _buildContactItem(
              context,
              icon: Icons.picture_as_pdf,
              label: 'My Resume',
              onTap: () => _launchURL("${contact["resume"]}"),
            ),
            const Divider(),
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
                // const SizedBox(width: 18),
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
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
