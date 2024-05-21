import 'package:flutter/material.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({Key? key}) : super(key: key);

  @override
  _LanguageTranslationPageState createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['Hindi', 'English', 'German'];
  var originLanguage = 'Hindi'; // Default "From" language
  var destinationLanguage = 'English'; // Default "To" language
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) {
    // Simulate translation based on selected languages
    String translation = "$input translated from $src to $dest";

    setState(() {
      output = translation;
    });
  }


  String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Hindi':
        return 'hi';
      case 'German':
        return 'ger';
      default:
        return '--';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8C00FF),
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
        backgroundColor: Color(0xFF8C00FF),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    hint: Text(
                      originLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: originLanguage,
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  SizedBox(width: 40),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white, size: 40),
                  SizedBox(width: 40),
                  DropdownButton<String>(
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    hint: Text(
                      destinationLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: destinationLanguage,
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  controller: languageController,
                  decoration: InputDecoration(
                    labelText: 'ENTER YOUR TEXT',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00A8CC)),
              onPressed: () {
                translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
              },
              child: Text("Translate"),
            ),

              SizedBox(height: 20),
              Text(
                "\n$output",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
