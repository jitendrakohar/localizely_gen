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

### ▶️ From pub.dev

Install globally to use the CLI from anywhere:
```
dart pub global activate localizely_gen
```

### ▶️ From local path (for development)

Install globally to use the CLI from anywhere:
```
dart pub global activate --source path .
```


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

## ☕ Buy Me a Coffee

If you find this tool helpful and want to support future development, consider [buying me a coffee](https://coff.ee/jitendrakohar05)!

[![Buy Me a Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=☕&slug=jitendrakohar05&button_colour=FFDD00&font_colour=000000&font_family=Arial&outline_colour=000000&coffee_colour=ffffff)](https://coff.ee/jitendrakohar05)

## 💸 Donate via PayPal

Prefer PayPal? You can also support this project by donating here:  
👉 [paypal.me/donateLocalizeJson](paypal.me/donateLocalizeJson)
