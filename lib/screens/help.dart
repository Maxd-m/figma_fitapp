import 'package:flutter/material.dart';
import 'package:figma_fitapp/widgets/app_bottom_bar.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String activeMainTab = 'FAQ';
  String activeCategoryTab = 'General';

  final List<FaqModel> faqs = [
    FaqModel(
      question: 'Lorem ipsum dolor sit amet?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.',
      isExpanded: true,
    ),
    FaqModel(
      question: 'How do I reset my password?',
      answer:
          'You can reset your password in the settings tab under account security.',
    ),
    FaqModel(
      question: 'Is my data secure?',
      answer:
          'Yes, we use industry-standard encryption to protect all your personal information.',
    ),
    FaqModel(
      question: 'How to track progress?',
      answer: 'Go to the Progress Tracking menu from the home dashboard.',
    ),
    FaqModel(
      question: 'Lorem ipsum dolor sit amet?',
      answer: 'More information coming soon.',
    ),
    FaqModel(
      question: 'Lorem ipsum dolor sit amet?',
      answer: 'More information coming soon.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildCustomAppBar(),
              const SizedBox(height: 24),
              _buildHowCanWeHelpTitle(),
              const SizedBox(height: 18),
              _buildMainTabsRow(),
              const SizedBox(height: 10),
              _buildCategoryButtonsRow(),
              const SizedBox(height: 18),
              _buildSearchBar(),
              const SizedBox(height: 24),

              // Lista de FAQs con comportamiento de expansión
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: faqs.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xFFD4FF5E),
                    height: 1,
                    thickness: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return FaqItemWidget(faq: faqs[index]);
                  },
                ),
              ),
              const Divider(color: Color(0xFFD4FF5E), height: 1),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(activeTab: BottomTab.help),
    );
  }

  Widget _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          color: const Color(0xFFD4FF5E),
        ),
        const Text(
          'Help & FAQs',
          style: TextStyle(
            color: Color(0xFFB8A6FF),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _buildHowCanWeHelpTitle() {
    return const Text(
      'How Can We Help You?',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMainTabsRow() {
    return Row(
      children: [
        _buildTabButton(
          'FAQ',
          true,
          activeMainTab == 'FAQ',
          () => setState(() => activeMainTab = 'FAQ'),
        ),
        const SizedBox(width: 12),
        _buildTabButton(
          'Contact Us',
          false,
          activeMainTab == 'Contact Us',
          () => setState(() => activeMainTab = 'Contact Us'),
        ),
      ],
    );
  }

  Widget _buildTabButton(
    String label,
    bool isPrimary,
    bool isActive,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive
                ? (isPrimary ? const Color(0xFFD4FF5E) : Colors.white)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isActive ? Colors.transparent : Colors.white24,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive
                  ? (isPrimary ? Colors.black : const Color(0xFFB8A6FF))
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtonsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryButton('General', activeCategoryTab == 'General'),
          _buildCategoryButton('Account', activeCategoryTab == 'Account'),
          _buildCategoryButton('Services', activeCategoryTab == 'Services'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isActive,
        onSelected: (val) => setState(() => activeCategoryTab = label),
        selectedColor: const Color(0xFFD4FF5E),
        backgroundColor: Colors.indigo,
        labelStyle: TextStyle(
          color: isActive ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: isActive ? Colors.transparent : Colors.white10,
          ),
        ),
        showCheckmark: false,
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }
}

class FaqModel {
  final String question;
  final String? answer;
  bool isExpanded;
  FaqModel({required this.question, this.answer, this.isExpanded = false});
}

class FaqItemWidget extends StatefulWidget {
  final FaqModel faq;
  const FaqItemWidget({super.key, required this.faq});

  @override
  State<FaqItemWidget> createState() => _FaqItemWidgetState();
}

class _FaqItemWidgetState extends State<FaqItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () =>
              setState(() => widget.faq.isExpanded = !widget.faq.isExpanded),
          title: Text(
            widget.faq.question,
            style: const TextStyle(
              color: Color(0xFFB8A6FF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            widget.faq.isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: const Color(0xFFD4FF5E),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
            child: Text(
              widget.faq.answer ?? '',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
          crossFadeState: widget.faq.isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
