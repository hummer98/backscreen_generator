import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'entry_form.dart';

class EntryFormPage extends StatelessWidget {
  final _key = GlobalKey();

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
        title: Text('EntryFormPage'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                formControlName: 'name',
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: '名前',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                formControlName: 'takingAbout',
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: '話したいこと',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                formControlName: 'times',
                style: TextStyle(height: 1.2, inherit: true),
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: 'times',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                formControlName: 'twitter',
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: 'Twitterアカウント',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReactiveTextField(
                formControlName: 'description',
                style: TextStyle(height: 1.2, inherit: true),
                maxLines: 4,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  labelText: '自己紹介',
                ),
              ),
            ),
            OutlineButton(
              child: Text('Generate'),
              onPressed: () async {
                final data = await createImageFromWidget(GeneratedScreen(value: EntryForm.fromJson(form.value)));
                final href = "data:application/octet-stream;name=backscreen.png;base64,${base64Encode(data)}";
                final anchorElement = AnchorElement(href: href);
                anchorElement.download = 'backscreen.png';
                anchorElement.click();
              },
            ),
            Builder(builder: (context) {
              final form = ReactiveForm.of(context);
              return GeneratedScreen(value: EntryForm.fromJson(form.value));
            }),
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
  const Caption(this.text, {Key key, this.fontSize = 36.0}) : super(key: key);
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
    // @required this.captureKey,
    @required this.value,
  }) : super(key: key);

  // final GlobalKey captureKey;
  final EntryForm value;

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: captureKey,
      color: Colors.grey,
      margin: EdgeInsets.all(48),
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
                  Caption(
                    value.takingAbout,
                    fontSize: 48,
                  ),
                  Caption(value.name),
                  Caption(value.twitter),
                  Caption(value.times),
                ],
              ),
            ),
            Positioned(
              bottom: 48,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Caption(
                  value.description,
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
