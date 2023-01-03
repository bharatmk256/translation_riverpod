import 'package:flutter/material.dart';
import 'package:translation_riverpod/app/core/language/language_provider.dart';
import 'package:translation_riverpod/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale language = ref.watch(languageProvider);
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(l10n.helloWorld),
            ),
            DropdownButton<Locale>(
              value: language,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (Locale? value) {
                ref
                    .read(
                      languageProvider.notifier,
                    )
                    .changeLanguage(value!);
              },
              items: AppLocalizations.supportedLocales
                  .map<DropdownMenuItem<Locale>>(
                (Locale value) {
                  return DropdownMenuItem<Locale>(
                    value: value,
                    child: Text(value.languageCode),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
