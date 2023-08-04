import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcWidget extends StatefulWidget {
  const NfcWidget({super.key});

  @override
  State<NfcWidget> createState() => _NfcWidgetState();
}

class _NfcWidgetState extends State<NfcWidget> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    _tagRead();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SafeArea(
          child: FutureBuilder<bool>(
            future: NfcManager.instance.isAvailable(),
            builder: (context, ss) => ss.data != true
                ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
                : ValueListenableBuilder<dynamic>(
                    valueListenable: result,
                    builder: (context, value, _) => Text('$value??' ' '),
                  ),
          ),
        ),
        
      ]),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      var payload = ndef!.cachedMessage!.records[0].payload;
      var sub = payload.sublist(payload[0] + 1);
      String tagRecordText = String.fromCharCodes(sub);
      result.value = tagRecordText;
    });
  }
}

