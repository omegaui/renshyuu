import 'package:renshyuu/core/verb.dart';

class VerbHierarchy {
  VerbHierarchy._();

  static Verb generate(String dictionaryForm, bool isIchidan) {
    final verb = dictionaryForm.substring(0, dictionaryForm.length - 1);
    final verbEnding = dictionaryForm[dictionaryForm.length - 1];
    if (isIchidan) {
      return IchidanVerb(dictionaryForm, verb, verbEnding);
    } else {
      return GodanVerb(dictionaryForm, verb, verbEnding);
    }
  }
}
