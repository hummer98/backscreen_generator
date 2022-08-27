# これは何?

バーチャル背景ジェネレーター
https://backscreen-generator.web.app/

Zoomでの懇親会などで、バーチャル背景に自己紹介を記述したい場合に
簡単に画像を作りたいという課題を解決します。

上記URLにアクセスし、表示したい項目を入れると、ボタンひとつでPNG画像をダウンロードできます。

## ローカル起動に必要なオプション
* `flutter run -d chrome --web-renderer canvaskit --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false --release`
  * `--release`をつけないとアイコンのプレビューができない
  * `--dart-define=BROWSER_IMAGE_DECODING_ENABLED=false`をつけないとダウンロード時にアイコンが画像にレンダリングされない

## Buildコマンド
* `flutter build web --web-renderer canvaskit --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false --release`
* `firebase deploy`

## Architecture / アーキテクチャ
* Flutter Web + Firebase Hosting

## つくったひと
* [@hummer](http://twitter.com/hummer)

## Release Note

### 1.1.3 (2022.08.27)
- Slack画像サーバーのCORSを突破できなかったのでアップロード方式に変更

### 1.1.2 (2022.08.27)
- 保存機能を追加(LocalStorage)
- 右下にアイコンを指定できるようにした
- 左上側の空の項目をトルツメに変更

### 1.1.1 (2022.02.11)
- 表示が中華フォントになる問題を解消
- URLに/#/が付く問題を解消

### 1.1.0 (2022.02.11)
- 画像が真っ白になってダウンロードされる問題に対応