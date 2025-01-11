enum Stem {
  a,
  i,
  u,
  e,
  o,
}

Map<String, List<String>> connections = {
  "う": ["わ", "い", "う", "え", "お"],
  "す": ["さ", "し", "す", "せ", "そ"],
  "る": ["ら", "り", "る", "れ", "ろ"],
  "む": ["ま", "み", "む", "め", "も"],
  "ぶ": ["ば", "び", "ぶ", "べ", "ぼ"],
  "ぬ": ["な", "に", "ぬ", "ね", "の"],
  "く": ["か", "き", "く", "け", "こ"],
  "ぐ": ["が", "ぎ", "ぐ", "げ", "ご"],
  "つ": ["た", "ち", "つ", "て", "と"],
};

Map<String, String> teForms = {
  "うつる": "って",
  "むぶぬ": "んで",
  "く": "いて",
  "ぐ": "いで",
  "す": "して",
};

String stem(String verbEnding, Stem stem) {
  return connections[verbEnding]![Stem.values.indexOf(stem)];
}

String getTeForm(String verbEnding) {
  for (final key in teForms.keys) {
    if (key.contains(verbEnding)) {
      return teForms[key]!;
    }
  }
  throw Exception("Invalid verb ending: $verbEnding");
}
