// Renshyuu
// Generates て forms and all-stem conjugations for the verbs,
// from a verb list file provided with --generate flag.
// For ex: See file [renshyuu_generate.dart]

import 'dart:io';

import 'package:renshyuu/core/verb.dart';
import 'package:renshyuu/core/verb_formatter.dart';
import 'package:renshyuu/core/verb_hierarchy.dart';

void main(List<String> args) {
  if (args.contains("--generate")) {
    final verbListFilePath = args.last;
    final verbListFile = File(verbListFilePath);
    if (verbListFile.existsSync()) {
      final lines = verbListFile.readAsLinesSync();
      final verbs = <Verb>[];
      for (var line in lines) {
        final isIchidan = line.contains("*");
        if (isIchidan) {
          line = line.replaceAll("*", "");
        }
        final verb = VerbHierarchy.generate(
          line,
          isIchidan,
        );
        verbs.add(verb);
      }

      int i = 0;
      for (final verb in verbs) {
        print(VerbFormatter.encode(verb, prefix: "(${++i}) "));
      }
    } else {
      print("File: $verbListFilePath does not exists.");
    }
  }
}
