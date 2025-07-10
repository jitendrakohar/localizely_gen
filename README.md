# 🈯 localizely_gen

**localizely_gen** is a Dart CLI tool that generates localization files in multiple languages by translating a base JSON (e.g., `en.json`) using [Google Translate](https://pub.dev/packages/translator). It's perfect for Flutter or Dart projects that need fast and easy translation support.

---

## ✨ Features

- 🔁 Batch translation of large localization files
- 🌍 Supports any language Google Translate offers
- 📦 Outputs per-language JSON files
- 🚀 CLI-friendly — run from terminal or scripts
- 📊 Shows progress while translating

---

## 📦 Installation
dart pub global activate --source path .


## Usage

```bash
dart run localizely_gen --input=assets/en.json --output=assets/langs --langs=es,fr,hi
```

## 🔧 Arguments
| Option            | Description                                         | Required                         |
| ----------------- | --------------------------------------------------- | -------------------------------- |
| `--input` / `-i`  | Path to base JSON file (e.g., `en.json`)            | ✅ Yes                            |
| `--output` / `-o` | Output directory for translated files               | ❌ No *(defaults to `./locales`)* |
| `--langs` / `-l`  | Comma-separated target languages (e.g., `es,fr,de`) | ✅ Yes                            |
| `--help` / `-h`   | Show help message                                   | ❌ No                             |



## 📜 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.



## ❤️ Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to submit a pull request or open an issue.
