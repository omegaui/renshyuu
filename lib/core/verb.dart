import 'package:renshyuu/core/stems.dart';

abstract class Verb {
  final String dictionaryForm;
  final String verb;
  final String verbEnding;

  Verb(this.dictionaryForm, this.verb, this.verbEnding);

  String negativeForm();

  String politeForm();

  String imperetiveForm();

  String hypotheticalForm();

  String potentialForm();

  String volitionalForm();

  String shouldForm();

  String teForm();
}

class IchidanVerb extends Verb {
  IchidanVerb(super.dictionaryForm, super.verb, super.verbEnding);

  @override
  String hypotheticalForm() {
    return "$verbれば";
  }

  @override
  String imperetiveForm() {
    return "$verbろ";
  }

  @override
  String negativeForm() {
    return "$verbない";
  }

  @override
  String politeForm() {
    return "$verbます";
  }

  @override
  String potentialForm() {
    return "$verbられる";
  }

  @override
  String shouldForm() {
    return "$verbましょう";
  }

  @override
  String volitionalForm() {
    return "$verbよう";
  }

  @override
  String teForm() {
    return "$verbて";
  }
}

class GodanVerb extends Verb {
  GodanVerb(super.dictionaryForm, super.verb, super.verbEnding);

  @override
  String hypotheticalForm() {
    return "$verb${stem(verbEnding, Stem.e)}ば";
  }

  @override
  String imperetiveForm() {
    return "$verb${stem(verbEnding, Stem.e)}";
  }

  @override
  String negativeForm() {
    return "$verb${stem(verbEnding, Stem.a)}ない";
  }

  @override
  String politeForm() {
    return "$verb${stem(verbEnding, Stem.i)}ます";
  }

  @override
  String potentialForm() {
    return "$verb${stem(verbEnding, Stem.e)}る";
  }

  @override
  String shouldForm() {
    return "$verb${stem(verbEnding, Stem.i)}ましょう";
  }

  @override
  String volitionalForm() {
    return "$verb${stem(verbEnding, Stem.o)}う";
  }

  @override
  String teForm() {
    return "$verb${getTeForm(verbEnding)}";
  }
}
