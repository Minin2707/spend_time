import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/localization/l10n.dart';
import 'package:spend_time/core/theme/app_radius.dart';
import 'package:spend_time/core/theme/app_spacing.dart';
import 'package:spend_time/core/widgets/app_button.dart';
import 'package:spend_time/core/widgets/app_card.dart';
import 'package:spend_time/core/widgets/app_text_field.dart';
import 'package:spend_time/features/topics/application/empty_topic_name_exception.dart';
import 'package:spend_time/features/topics/application/topics_notifier.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';
import 'package:spend_time/features/topics/presentation/widgets/topic_color_selector.dart';
import 'package:spend_time/features/topics/presentation/widgets/topic_icon_selector.dart';

class CreateTopicScreen extends ConsumerStatefulWidget {
  const CreateTopicScreen({
    super.key,
  });

  static const double _headerSideWidth = 48;
  static const double _placeholderHeight = AppSpacing.xxl * 2;

  @override
  ConsumerState<CreateTopicScreen> createState() =>
      _CreateTopicScreenState();
}

class _CreateTopicScreenState extends ConsumerState<CreateTopicScreen> {
  late final TextEditingController _nameController;

  bool _isSubmitting = false;
  TopicColorKey _selectedColor = TopicColorKey.blue;
  TopicIconKey _selectedIcon = TopicIconKey.book;

  bool get _canCreate {
    return _nameController.text.trim().isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(_handleNameChanged);
  }

  @override
  void dispose() {
    _nameController
      ..removeListener(_handleNameChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final keyboardInset = MediaQuery.viewInsetsOf(
      context,
    ).bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSpacing.lg,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.only(
                  bottom: keyboardInset,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: CreateTopicScreen._headerSideWidth,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: _isSubmitting
                                      ? null
                                      : _handleClosePressed,
                                  icon: const Icon(
                                    Icons.close_rounded,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Create Topic',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: CreateTopicScreen._headerSideWidth,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSpacing.xl,
                        ),
                        Text(
                          'Name',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: AppSpacing.sm,
                        ),
                        AppTextField(
                          controller: _nameController,
                          hintText: 'Enter topic name',
                        ),
                        const SizedBox(
                          height: AppSpacing.xl,
                        ),
                        _CreateTopicSection(
                          title: 'Icon',
                          child: TopicIconSelector(
                            selectedIcon: _selectedIcon,
                            onChanged: _updateSelectedIcon,
                          ),
                        ),
                        const SizedBox(
                          height: AppSpacing.xl,
                        ),
                        _CreateTopicSection(
                          title: 'Color',
                          child: TopicColorSelector(
                            selectedColor: _selectedColor,
                            onChanged: _updateSelectedColor,
                          ),
                        ),
                        const Spacer(),
                        AppButton(
                          text: 'Create Topic',
                          isLoading: _isSubmitting,
                          onPressed: _canCreate && !_isSubmitting
                              ? _handleCreatePressed
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _updateSelectedIcon(
    TopicIconKey iconKey,
  ) {
    setState(() {
      _selectedIcon = iconKey;
    });
  }

  void _updateSelectedColor(
    TopicColorKey colorKey,
  ) {
    setState(() {
      _selectedColor = colorKey;
    });
  }

  void _handleNameChanged() {
    setState(() {});
  }

  void _handleClosePressed() {
    Navigator.of(context).pop(false);
  }

  Future<void> _handleCreatePressed() async {
    if (!_canCreate || _isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    var shouldResetSubmitting = true;

    try {
      await ref.read(topicsProvider.notifier).createTopic(
            name: _nameController.text,
            colorKey: _selectedColor,
            iconKey: _selectedIcon,
          );

      if (!mounted) {
        return;
      }

      shouldResetSubmitting = false;
      Navigator.of(context).pop(true);
    } on EmptyTopicNameException {
      if (!mounted) {
        return;
      }

      _showErrorSnackBar(
        context.l10n.emptyTopicNameMessage,
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      _showErrorSnackBar(
        context.l10n.createTopicErrorMessage,
      );
    } finally {
      if (shouldResetSubmitting && mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showErrorSnackBar(
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }
}

class _CreateTopicSection extends StatelessWidget {
  const _CreateTopicSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        child,
      ],
    );
  }
}

class _CreateTopicPlaceholder extends StatelessWidget {
  const _CreateTopicPlaceholder({
    required this.text,
  });

  final String text;

  @override
  Widget build(
    BuildContext context,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      child: Container(
        height: CreateTopicScreen._placeholderHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppRadius.large,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
        ),
      ),
    );
  }
}
