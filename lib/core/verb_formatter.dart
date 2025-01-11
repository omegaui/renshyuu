import 'package:renshyuu/core/verb.dart';

class VerbFormatter {
  VerbFormatter._();

  static String encode(Verb verb, {String? prefix}) {
    final isIchidan = verb.runtimeType == IchidanVerb;
    StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "${prefix ?? ""}${verb.dictionaryForm}${isIchidan ? "*" : ""}",
    );
    buffer.writeln(verb.teForm());
    buffer.writeln(verb.negativeForm());
    buffer.writeln(verb.politeForm());
    buffer.writeln("${verb.imperetiveForm()} (cmd)");
    buffer.writeln(verb.hypotheticalForm());
    buffer.writeln("${verb.potentialForm()} (can)");
    buffer.writeln("${verb.volitionalForm()} (let)");
    buffer.writeln(verb.shouldForm());
    return buffer.toString();
  }
}
