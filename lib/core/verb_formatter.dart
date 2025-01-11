import 'package:renshyuu/core/verb.dart';

class VerbFormatter {
  VerbFormatter._();

  static String encode(Verb verb, {String? prefix}) {
    final isIchidan = verb.runtimeType == IchidanVerb;
    StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "${prefix ?? ""}${verb.dictionaryForm}${isIchidan ? "*" : ""}",
    );
    // te-form
    buffer.writeln([verb.teForm(), verb.teIruForm()].join("、"));
    // polite-forms
    buffer.writeln(verb.politeForm().join("、"));
    // negative, imperative, potential, volitional
    buffer.writeln([
      verb.negativeForm(),
      verb.imperetiveForm(),
      verb.potentialForm(),
      verb.volitionalForm()
    ].join("、"));
    // should form
    buffer.writeln(verb.shouldForm());
    // hypothetical form
    buffer.writeln(verb.hypotheticalForm());
    return buffer.toString();
  }
}
