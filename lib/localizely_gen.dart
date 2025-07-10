// lib/localizely_gen.dart

library localizely_gen;

import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'package:translator/translator.dart';

class LocalizelyGen {
  final translator = GoogleTranslator();

  void run(List<String> arguments) async {
    final parser = ArgParser()
      ..addOption('input', abbr: 'i', help: 'Path to base JSON file (e.g., en.json)')
      ..addOption('output', abbr: 'o', help: 'Output directory')
      ..addOption('langs', abbr: 'l', help: 'Comma-separated language codes (e.g., es,fr,hi)')
      ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage');

    final args = parser.parse(arguments);

    if (args['help'] == true || args['input'] == null) {
      print(parser.usage);
      return;
    }

    final inputPath = args['input'];
    final outputDir = args['output'] ?? './locales';
    final langs = (args['langs'] ?? 'es,fr').split(',').map((e) => e.trim());

    final inputFile = File(inputPath);
    if (!await inputFile.exists()) {
      print('❌ File not found: $inputPath');
      return;
    }

    final Map<String, dynamic> baseJson = jsonDecode(await inputFile.readAsString());

    for (final lang in langs) {
      print('\n🌍 Translating to [$lang]...');
      final translated = await _translateMap(baseJson, lang);
      final outPath = p.join(outputDir, '$lang.json');
      await File(outPath).create(recursive: true);
      await File(outPath).writeAsString(JsonEncoder.withIndent('  ').convert(translated));
      print('✅ [$lang] Translation complete → saved to: $outPath');
    }

    print('\n🎉 All translations completed!');
  }

  Future<Map<String, String>> _translateMap(Map<String, dynamic> base, String toLang) async {
    final Map<String, String> translated = {};
    final entries = base.entries.toList();
    final total = entries.length;

    const batchSize = 50;
    int completed = 0;

    for (int i = 0; i < total; i += batchSize) {
      final batch = entries.skip(i).take(batchSize);

      final results = await Future.wait(batch.map((entry) async {
        try {
          final result = await translator.translate(entry.value.toString(), to: toLang);
          return MapEntry(entry.key, result.text);
        } catch (e) {
          print('⚠️ Failed: ${entry.key} → using original.');
          return MapEntry(entry.key, entry.value.toString());
        }
      }));

      translated.addEntries(results);
      completed += batch.length;

      print('  ✅ Progress [$toLang]: $completed / $total translated...');
      await Future.delayed(Duration(milliseconds: 250));
    }

    return translated;
  }
}
