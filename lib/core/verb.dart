import 'package:renshyuu/core/stems.dart';

abstract class Verb {
  final String dictionaryForm;
  final String verb;
  final String verbEnding;

  Verb(this.dictionaryForm, this.verb, this.verbEnding);

  String get type => runtimeType == IchidanVerb ? "ichidan" : "godan";

  String negativeForm();

  List<String> politeForm();

  String imperetiveForm();

  String hypotheticalForm();

  String potentialForm();

  String volitionalForm();

  String shouldForm();

  String teForm();

  String teIruForm() {
    return "${teForm()}いる";
  }

  List<String> get all {
    final result = <String>[];
    result.add(dictionaryForm);
    result.add(negativeForm());
    result.add(potentialForm());
    result.add(imperetiveForm());
    result.add(hypotheticalForm());
    result.add(volitionalForm());
    result.add(shouldForm());
    result.add(teForm());
    result.add(teIruForm());
    result.addAll(politeForm());
    return result;
  }
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
  List<String> politeForm() {
    return ["$verbます", "$verbません", "$verbました", "$verbませんでした"];
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
  List<String> politeForm() {
    return [
      "$verb${stem(verbEnding, Stem.i)}ます",
      "$verb${stem(verbEnding, Stem.i)}ません",
      "$verb${stem(verbEnding, Stem.i)}ました",
      "$verb${stem(verbEnding, Stem.i)}ませんでした"
    ];
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
