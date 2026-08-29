import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'sections/about_section.dart';
import 'sections/certifications_section.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'widgets/nav/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_onScroll);

  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());

  static const List<String> _labels = [
    'home',
    'about',
    'experience',
    'projects',
    'skills',
    'certifications',
    'education',
    'contact',
  ];

  int _activeIndex = 0;
  bool _isScrolled = false;
  bool _lockActiveIndex = false;

  void _onScroll() {
    final double offset = _scrollController.offset;
    final bool scrolled = offset > 8;

    int active = 0;
    final Size viewport = MediaQuery.sizeOf(context);
    final double threshold = viewport.height * 0.45;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final BuildContext? ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final RenderBox? box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.attached || !box.hasSize) continue;
      if (box.localToGlobal(Offset.zero).dy <= threshold) active = i;
    }

    // Snap to the last section near page bottom.
    if (_scrollController.position.maxScrollExtent - offset < 40) {
      active = _sectionKeys.length - 1;
    }

    final bool activeChanged = !_lockActiveIndex && active != _activeIndex;
    if (activeChanged || scrolled != _isScrolled) {
      setState(() {
        if (!_lockActiveIndex) _activeIndex = active;
        _isScrolled = scrolled;
      });
    }
  }

  Future<void> _selectSection(int index) async {
    final BuildContext? ctx = _sectionKeys[index].currentContext;
    if (ctx == null) return;
    setState(() {
      _activeIndex = index;
      _lockActiveIndex = true;
    });
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
    if (!mounted) return;
    setState(() => _lockActiveIndex = false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool compact = MediaQuery.sizeOf(context).width < 900;

    final Widget body = SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KeyedSubtree(
            key: _sectionKeys[0],
            child: HeroSection(
              listenTo: _scrollController,
              onViewWork: () => _selectSection(3),
            ),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[1],
            child: AboutSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[2],
            child: ExperienceSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[3],
            child: ProjectsSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[4],
            child: SkillsSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[5],
            child: CertificationsSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[6],
            child: EducationSection(listenTo: _scrollController),
          ),
          Divider(color: AppColors.border.withValues(alpha: 0.6), height: 1),
          KeyedSubtree(
            key: _sectionKeys[7],
            child: ContactSection(listenTo: _scrollController),
          ),
          const PortfolioFooter(),
        ],
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: TopNavBar(
          sections: [
            for (final String label in _labels)
              SectionNav(
                label: label,
                key: GlobalKey(debugLabel: label),
              ),
          ],
          activeIndex: _activeIndex,
          onSelect: _selectSection,
          isCompact: compact,
          isScrolled: _isScrolled,
        ),
      ),
      backgroundColor: AppColors.background,
      body: body,
    );
  }
}
