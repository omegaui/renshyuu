import 'dart:io';

import 'package:renshyuu/core/verb.dart';
import 'package:renshyuu/core/verb_hierarchy.dart';

class VerbClassifier {
  VerbClassifier._();

  static List<Verb> listFromFile(String path) {
    final verbs = <Verb>[];
    final verbListFile = File(path);
    if (verbListFile.existsSync()) {
      final lines = verbListFile.readAsLinesSync();
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
    } else {
      stderr.writeln("File: $path does not exists.");
    }
    return verbs;
  }
}
