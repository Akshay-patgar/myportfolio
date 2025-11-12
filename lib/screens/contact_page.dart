import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../widgets/no_scrollbar_behavior.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact = portfolioData["contact"] as Map<String, dynamic>;

    return ScrollConfiguration(
      behavior: NoScrollbarBehavior(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Scrollbar(
              thumbVisibility: true,
              radius: const Radius.circular(8),
              thickness: 10,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get in Touch',
                          style: GoogleFonts.poppins(
                            fontSize: isWide ? 36 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Divider(
                          color: Color(0xFF1434A4),
                          thickness: 2,
                          endIndent: 200,
                          indent: 200,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "I'm currently open to new opportunities. Let's connect!",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),

                        // ✅ Contact info card
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: isWide
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: _buildContactInfo(
                                        context,
                                        contact,
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      flex: 1,
                                      child: _buildSocialButtons(
                                        context,
                                        contact,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    _buildContactInfo(context, contact),
                                    const SizedBox(height: 24),
                                    _buildSocialButtons(context, contact),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, Map<String, dynamic> contact) {
    return Column(
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
      ],
    );
  }

  Widget _buildSocialButtons(
    BuildContext context,
    Map<String, dynamic> contact,
  ) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Connect with Me',
            style: GoogleFonts.poppins(
              fontSize: isWide ? 22 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2,
            width: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 28),

          // ✅ Centered single LinkedIn button with hover animation
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FlutterSocialButton(
              onTap: () => _launchURL(contact["linkedin"]),
              buttonType: ButtonType.linkedin,
              mini: false,
              showLabel: true,
              title: "Linkedin",
            ),
            // GestureDetector(
            //   onTap: () => _launchURL(contact["linkedin"]),
            //   child: AnimatedContainer(
            //     duration: const Duration(milliseconds: 250),
            //     curve: Curves.easeInOut,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 24.0,
            //       vertical: 12.0,
            //     ),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
            //       borderRadius: BorderRadius.circular(30),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Theme.of(
            //             context,
            //           ).colorScheme.primary.withOpacity(0.25),
            //           blurRadius: 12,
            //           offset: const Offset(0, 6),
            //         ),
            //       ],
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         const Icon(
            //           Icons.linked_camera_rounded,
            //           color: Colors.white,
            //           size: 22,
            //         ),
            //         const SizedBox(width: 10),
            //         Text(
            //           'LinkedIn',
            //           style: GoogleFonts.poppins(
            //             fontSize: 16,
            //             color: Colors.white,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),

          const SizedBox(height: 20),
          Text(
            'Let’s connect professionally!',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _animatedSocialButton(
    BuildContext context, {
    required Widget icon,
    String? label,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 6),
              if (label != null)
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomCircleIcon(
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black38,
        child: Icon(icon, color: color),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(color: Colors.black87, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
