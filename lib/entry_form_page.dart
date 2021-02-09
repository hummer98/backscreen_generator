import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'entry_form.dart';

class EntryFormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'takingAbout': FormControl(value: 'お金について'),
      'name': FormControl(value: 'はまあ', validators: [Validators.required]),
      'times': FormControl(value: '#times_hummer'),
      'twitter': FormControl(value: '@hummer'),
      'description': FormControl(value: 'いい感じにフリーランス8期目\nだけど質問ある？'),
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Zoomバーチャル背景ジェネレーター'),
      ),
      body: ReactiveForm(
        formGroup: form,
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(child: Text('入力', style: Theme.of(context).textTheme.headline5)),
                  ReactiveTextField(
                    formControlName: 'takingAbout',
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: '話したいこと',
                    ),
                  ),
                  SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: 'name',
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: '名前',
                    ),
                  ),
                  SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: 'twitter',
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Twitterアカウント',
                    ),
                  ),
                  SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: 'times',
                    style: TextStyle(height: 1.2, inherit: true),
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: 'times',
                    ),
                  ),
                  SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: 'description',
                    style: TextStyle(height: 1.2, inherit: true),
                    maxLines: 4,
                    decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      labelText: '自己紹介',
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            '生成する！',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            final data = await createImageFromWidget(GeneratedScreen());
                            final href =
                                "data:application/octet-stream;name=backscreen.png;base64,${base64Encode(data)}";
                            final anchorElement = AnchorElement(href: href);
                            anchorElement.download = 'backscreen.png';
                            anchorElement.click();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text('作った人'),
                  SizedBox(height: 8),
                  Text('Twitter:'),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    text: 'https://twitter.com/hummer',
                  ),
                  SizedBox(height: 8),
                  Text('Github:'),
                  Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    text: 'https://github.com/hummer98/backscreen_generator',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text('プレビュー', style: Theme.of(context).textTheme.headline5),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 1920 / 2,
                  height: 1024 / 2,
                  child: ReactiveFormConsumer(builder: (context, formGroup, snapshot) {
                    return GeneratedScreen();
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> createImageFromWidget(Widget widget) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final RenderView renderView = RenderView(
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(size: const Size(1920, 1024), devicePixelRatio: ui.window.devicePixelRatio),
      window: null,
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
    return byteData.buffer.asUint8List();
  }
}

class Caption extends StatelessWidget {
  final String text;
  final double fontSize;
  const Caption(this.text, {Key key, this.fontSize = 32.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: Colors.black87, height: 1.4),
    );
  }
}

class GeneratedScreen extends StatelessWidget {
  const GeneratedScreen({
    Key key,
    // @required this.value,
  }) : super(key: key);

  // final EntryForm value;

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild!');
    final value = EntryForm.fromJson(ReactiveForm.of(context).value);
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(8),
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
                  Caption(value.takingAbout, fontSize: 48),
                  Caption(value.name),
                  Caption(value.twitter),
                  Caption(value.times),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Caption(value.description, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
