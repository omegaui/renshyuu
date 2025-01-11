// Renshyuu
// Generates て forms and all-stem conjugations for the verbs,
// from a verb list file provided with --generate flag.
// For ex: See file [renshyuu_generate.dart]

import 'dart:convert';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:renshyuu/core/verb.dart';
import 'package:renshyuu/core/verb_classifier.dart';
import 'package:renshyuu/core/verb_formatter.dart';
import 'package:renshyuu/core/verb_hierarchy.dart';

const version = "0.0.1";

enum Command {
  enter,
  progress,
  show,
  help,
  exit,
}

void main(List<String> args) {
  if (args.contains("--help")) {
    stdout.writeln("Renshyuu v$version");
    stdout.writeln("Learn Japanese by practising verb conjugations.");
    stdout.writeln();
    stdout.writeln("usage: renshyuu --source source-path");
    stdout.writeln(
      "source-path: This is a plain/txt file containing new line separated verbs, verbs that are ichidan should have the * (asterisk) symbol as suffix.",
    );
    stdout.writeln();
    stdout.writeln("more options:");
    stdout.writeln("--help\tPrint this help message");
    return;
  }
  // compulsory argument --source
  if (!args.contains("--source") || args.length == 1) {
    stderr.writeln("Incorrect Usage:");
    stderr.writeln("Verb source list not specified ...");
    stderr.writeln("Please provide a source file, example command:");
    stderr.writeln();
    stderr.writeln("renshyuu --source verb_list.txt");
    stderr.writeln();
    stderr.writeln("Run renshyuu --help for more info.");
    return;
  }

  // generate conjugations
  final sourcePath = args[args.indexOf("--source") + 1];
  final verbs = VerbClassifier.listFromFile(sourcePath);
  final practiceMatrix = <String>[];
  for (final verb in verbs) {
    practiceMatrix.addAll(verb.all);
  }
  practiceMatrix.shuffle();

  final noOfVerbs = verbs.length;
  void printHelp() {
    stdout.writeln("Welcome to Renshyuu REPL".blue);
    stdout.writeln(
        "In this session there are, ${noOfVerbs.toString().yellow} verbs and about ${practiceMatrix.length.toString().yellow} conjugations ");
    stdout.writeln(
        "to practice sentence transformation, in this prompt, you can");
    stdout.writeln(
        "practice learning these conjugations by simply pressing enter and making");
    stdout
        .writeln("a sentence yourself with random conjugations given to you.");
    stdout.writeln("");
    stdout.writeln("Commands available:");
    stdout.writeln("Type enter - To get the next random conjugation.");
    stdout.writeln("Type show - To show all the conjugations for a verb.");
    stdout.writeln("Type progress - To see learning progress.");
    stdout.writeln("Type help - To print this help message again.");
    stdout.writeln("Type exit - To exit Renshyuu REPL.");
  }

  printHelp();

  int practiceIndex = 0;
  var command = Command.enter;
  while (command != Command.exit) {
    stdout.write("> ");
    String? nextCommand = stdin.readLineSync();
    if (nextCommand == null) {
      continue;
    } else {
      nextCommand = nextCommand.toLowerCase();
      try {
        if (nextCommand.isEmpty) {
          command = Command.enter;
        } else {
          command = Command.values.byName(nextCommand);
        }
      } catch (e) {
        stderr.writeln("Invalid Command : $nextCommand");
      }

      if (command == Command.exit) {
        stdout.writeln("Exiting Renshyuu ... ");
        break;
      } else if (command == Command.enter) {
        if (practiceIndex == practiceMatrix.length) {
          stdout.writeln(
              "🙌 Yay! You did practised all ${practiceMatrix.length} conjugations.");
          break;
        } else {
          stdout.writeln(
              "Try making a sentence with ${practiceMatrix[practiceIndex++].green.bold}");
        }
      } else if (command == Command.progress) {
        stdout.writeln(
            "Targets left: ${practiceMatrix.length - practiceIndex}");
        stdout.writeln("Conjugations practiced: $practiceIndex");
      } else if (command == Command.show) {
        stdout.writeln("Enter the dictionary form of the verb".yellow);
        stdout.write("> ");
        String? dictionaryForm = stdin.readLineSync(encoding: utf8);
        if (dictionaryForm != null && dictionaryForm.trim().isNotEmpty) {
          stdout.writeln("Finding: \"${dictionaryForm.bold}\"");
          final hasVerb = verbs.any((e) => e.dictionaryForm == dictionaryForm);
          if (!hasVerb) {
            stderr.writeln(
                "Dictionary form $dictionaryForm is not present in provided source list.");
            stderr.writeln("Please add it in $sourcePath file.");
          } else {
            final verb =
                verbs.firstWhere((e) => e.dictionaryForm == dictionaryForm);
            stdout.writeln(VerbFormatter.format(verb, prefix: "(${verb.type}) "));
          }
        }
      } else if (command == Command.help) {
        printHelp();
      }
    }
  }
}
