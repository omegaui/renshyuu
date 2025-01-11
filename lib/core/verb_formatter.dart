import 'package:chalkdart/chalkstrings.dart';
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

  static String format(Verb verb, {String? prefix}) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "${prefix ?? ""}Dictionary Form: ${verb.dictionaryForm.bold}",
    );
    // te-form
    buffer.writeln("Te and Te-iru forms: ${[
      verb.teForm(),
      verb.teIruForm()
    ].join("、").green.bold}");
    // polite-forms
    buffer.writeln("Polite Forms: ${verb.politeForm().join("、").green.bold}");
    // negative, imperative, potential, volitional
    buffer.writeln("Negative Form: ${verb.negativeForm().green.bold}");
    buffer.writeln("Imperetive Form: ${verb.imperetiveForm().green.bold}");
    buffer.writeln("Potential Form: ${verb.politeForm().join("、").green.bold}");
    buffer.writeln("Volitional Form: ${verb.volitionalForm().green.bold}");
    // should form
    buffer.writeln("Should Form: ${verb.shouldForm().green.bold}");
    // hypothetical form
    buffer.write("Hypothetical (If) Form: ${verb.hypotheticalForm().green.bold}");
    return buffer.toString();
  }
}
