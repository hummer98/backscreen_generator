import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:backscreen_generator/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'entry_form.dart';

class EntryFormPage extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final _previewKey = GlobalKey();

  final form = FormGroup({
    'takingAbout': FormControl<String>(value: ''),
    'name': FormControl<String>(value: ''),
    'times': FormControl<String>(value: ''),
    'twitter': FormControl<String>(value: ''),
    'description': FormControl<String>(value: ''),
    'iconUrl': FormControl<String>(value: ''),
  });

  @override
  Widget build(BuildContext context) {
    final memo = useMemoized(() => StorageService.loadEntryForm());
    final f = useFuture(memo);
    final data = f.data;
    if (data != null) {
      debugPrint('${data.toJson()}');
      form.value = data.toJson();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('バーチャル背景ジェネレーター'),
      ),
      body: (f.connectionState == ConnectionState.done)
          ? _renderForm(context)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _renderForm(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(child: Text('入力', style: Theme.of(context).textTheme.headline5)),
                ReactiveTextField<String>(
                  formControlName: 'takingAbout',
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: '話したいこと',
                  ),
                ),
                const SizedBox(height: 8),
                ReactiveTextField<String>(
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: '名前',
                  ),
                ),
                const SizedBox(height: 8),
                ReactiveTextField<String>(
                  formControlName: 'twitter',
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'Twitterアカウント',
                  ),
                ),
                const SizedBox(height: 8),
                ReactiveTextField<String>(
                  formControlName: 'times',
                  style: const TextStyle(height: 1.2, inherit: true),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: 'times',
                  ),
                ),
                const SizedBox(height: 8),
                // ReactiveTextField<String>(
                //   formControlName: 'iconUrl',
                //   style: const TextStyle(height: 1.2, inherit: true),
                //   decoration: const InputDecoration(
                //     isDense: true,
                //     border: OutlineInputBorder(),
                //     labelText: 'Slackアイコン',
                //   ),
                // ),
                const SizedBox(height: 8),
                ReactiveTextField<String>(
                  formControlName: 'description',
                  style: const TextStyle(height: 1.2, inherit: true),
                  maxLines: 4,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    labelText: '自己紹介',
                  ),
                ),
                const Text('Slackアイコン'),
                ElevatedButton(
                  onPressed: () async {
                    Uint8List? bytes = await ImagePickerWeb.getImageAsBytes();
                    if (bytes == null) return;
                    final s = "data:image/png;base64,${base64.encode(bytes)}";
                    form.updateValue({...form.value, "iconUrl": s});
                  },
                  child: const Text('Upload'),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        ),
                        child: const Text(
                          '生成する！',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          final data = await createImageFromKey(_previewKey);
                          final href = "data:application/octet-stream;name=backscreen.png;base64,${base64Encode(data)}";
                          final anchorElement = AnchorElement(href: href);
                          anchorElement.download = 'backscreen.png';
                          anchorElement.click();
                        },
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await StorageService.saveEntryForm(EntryForm.fromJson(form.value));
                //   },
                //   child: const Text('保存'),
                // ),
                const SizedBox(height: 32),
                const Text('作った人'),
                const SizedBox(height: 8),
                Wrap(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: FaIcon(FontAwesomeIcons.twitter),
                    ),
                    Linkify(
                      onOpen: (link) async {
                        if (await canLaunchUrl(Uri.parse(link.url))) {
                          await launchUrl(Uri.parse(link.url));
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: 'https://twitter.com/hummer',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: FaIcon(FontAwesomeIcons.github),
                    ),
                    Linkify(
                      onOpen: (link) async {
                        if (await canLaunchUrl(Uri.parse(link.url))) {
                          await launchUrl(Uri.parse(link.url));
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: 'https://github.com/hummer98/backscreen_generator',
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text('プレビュー', style: Theme.of(context).textTheme.headline5),
              Container(
                margin: const EdgeInsets.all(8),
                width: 1920 / 2,
                height: 1024 / 2,
                child: ReactiveFormConsumer(
                  builder: (context, formGroup, snapshot) {
                    return GeneratedScreen(
                      boundaryKey: _previewKey,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Uint8List?> fetchImage(String? url) async {
    if (url == null) return null;
    try {
      Uri uri = Uri.parse(url);

      final response = await get(uri, headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Methods': 'GET, PUT, DELETE, HEAD, OPTIONS',
        // 'Access-Control-Allow-Headers': 'Content-Type',
      });
      final bytes = response.bodyBytes;
      final mime = response.headers['content-type'] ?? 'image/png';
      // Image.memoryにdataURLでレンダリングさせるためにbase64文字列を生成
      final s = "data:$mime;base64,${base64.encode(bytes)}";
      return Uri.parse(s).data!.contentAsBytes();
    } catch (e) {
      debugPrint('Error: [fetchImage()] ${e.toString()}');
      rethrow;
    }
  }

  Future<Uint8List> createImageFromKey(GlobalKey key) async {
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<Uint8List> createImageFromWidget(Widget widget) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final RenderView renderView = RenderView(
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(size: const Size(1920, 1024), devicePixelRatio: ui.window.devicePixelRatio),
      window: WidgetsBinding.instance.window,
    );

    final PipelineOwner pipelineOwner = PipelineOwner()..rootNode = renderView;
    renderView.prepareInitialFrame();

    final BuildOwner buildOwner = BuildOwner();
    final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntrinsicHeight(child: IntrinsicWidth(child: widget)),
      ),
    ).attachToRenderTree(buildOwner);

    buildOwner
      ..buildScope(rootElement)
      ..finalizeTree();
    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: ui.window.devicePixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}

class Caption extends StatelessWidget {
  final String text;
  final double fontSize;
  const Caption(this.text, {Key? key, this.fontSize = 32.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: Colors.black87, height: 1.4),
    );
  }
}

class GeneratedScreen extends HookWidget {
  const GeneratedScreen({
    Key? key,
    required this.boundaryKey,
  }) : super(key: key);

  final GlobalKey boundaryKey;

  static const iconSize = 96.0;

  @override
  Widget build(BuildContext context) {
    final value = EntryForm.fromJson(ReactiveForm.of(context)!.value as Map<String, dynamic>);
    Uint8List? iconImage = Uri.parse(value.iconUrl).data!.contentAsBytes();
    return Stack(
      children: [
        RepaintBoundary(
          key: boundaryKey,
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (value.takingAbout.isNotEmpty) Caption(value.takingAbout, fontSize: 48),
                        if (value.name.isNotEmpty) Caption(value.name),
                        if (value.twitter.isNotEmpty) Caption(value.twitter),
                        if (value.times.isNotEmpty) Caption(value.times),
                      ],
                    ),
                  ),
                  if (iconImage != null)
                    Positioned(
                      bottom: 16,
                      right: 16,
                      width: iconSize,
                      height: iconSize,
                      // 起動オプションが
                      // --releaseでないとプレビューが表示されない
                      // --dart-define=BROWSER_IMAGE_DECODING_ENABLED=falseでないと, RepaintBoundaryでレンダリングされず真っ白になる
                      child: Image.memory(iconImage!),
                    ),
                  if (value.description.isNotEmpty)
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Caption(
                          value.description,
                          fontSize: 24,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        // if (value.iconUrl.isNotEmpty)
        //   Positioned(
        //     bottom: 16,
        //     right: 84,
        //     width: iconSize,
        //     height: iconSize,
        //     child: ImageNetwork(
        //       image: value.iconUrl,
        //       width: iconSize,
        //       height: iconSize,
        //       imageCache: CachedNetworkImageProvider(value.iconUrl),
        //     ),
        //   ),
      ],
    );
  }
}
