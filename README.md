This package allows you to manage the texts for different languages.


## Features

Use Fionai18n to show message according the user language.
You can define a message file for each language you want to manage.

## Getting started

This packages implements an idea that had been writing time ago in this article:
https://medium.com/stackademic/flutter-i18n-and-l10n-a-simple-way-to-internationalize-your-app-d32e39362b7a


## Usage

You can find a complete example the example directory.

You have to create one file for each language. 
The file has to have a name like this: messages_en.json 

The ISO language code should be included at the end of the name.

So, if you want to manage the languages spanish, english and german, you will have
to create 3 files like these:

1. messages_es.json
2. messages_en.json
3. messages_de.json

Suppose that you want to define 2 texts: "title" and "example", then the files should have:

Spanish:
```dart
{
"title": "Ejemplo de i18n",
"example": "Este es un texto de ejemplo"
}
```
English:
```dart
{
"title": "i18n Example",
"example": "This is an example text"
}
```

German:
```dart
{
"title": : "i18n-Beispiel",
"example": "Dies ist ein Beispieltext"
}
```

```dart
import 'package:fiona_i18n/fiona_i18n.dart';

void initialize() async{
  await Fionai18n().initialize(locale: "es");  
}

```
Then you will be able to use it:


```dart

String msgTitle = Fionai18n.message("title");

```


## Additional information

* See https://medium.com/stackademic/flutter-i18n-and-l10n-a-simple-way-to-internationalize-your-app-d32e39362b7a
