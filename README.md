## Renshyuu

Renshyuu is a learning tool for practicing verb conjugations.

I wrote it when I memorized the entire N5 vocabulary as it was difficult for me to be able to relate
to the source verb whenever I hear its complex conjugation for example あるく(to walk) has
あるいている (walking) as it's te-iru form whereas はる(to stick) verb has はって te-form, which
looks quite simple but someone like me who has just started N5 finds it difficult to relate to the
original verb when we hear はって in an actual compound sentence.

Whether you get my point or not, if you are hear to get a program that gives a list of all possible
conjugations for any given verb, you are at the right place.

Basically, you give renshyuu a list of verbs in their dictionary form (ichidan verbs marked with an *),
and renshyuu generates all possible conjugations and starts a practise session, where you will be
given, any random conjugation and you have to make a sentence with it, that's how simple it is, for me,
memorizing a whole "sentence" of my own instead of the "word" is easier.

## Features

- Self-generates correct verb conjugation for both ichidan and godan verbs.
- A Practice REPL included.

## Usage

Just run the following command in your terminal after adding renshyuu to your path:

```shell
renshyuu --source verb_list.txt
```

A verb list file is just a simple text file, containing verbs in Japanese of course, separated by
new-line character.
an example [n5 vocabulary file](https://github.com/omegaui/renshyuu/main/verb_list_n5.txt) is
provided with this project.

# Install

Download from github releases section or compile yourself.

You need to have dart installed to compile renshyuu.
```shell
dart compile exe --target-os windows .\bin\renshyuu.dart
```

For platform other than windows, replace **windows** in above command with your platform.