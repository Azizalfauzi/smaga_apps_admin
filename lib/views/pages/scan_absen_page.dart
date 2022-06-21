part of 'pages.dart';

class ScanAbsenPage extends StatefulWidget {
  const ScanAbsenPage({Key? key}) : super(key: key);

  @override
  State<ScanAbsenPage> createState() => _ScanAbsenPageState();
}

class _ScanAbsenPageState extends State<ScanAbsenPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            bottom: 100,
            child: buildResult(),
          ),
          Positioned(
            top: 20,
            child: buildControllButton(),
          ),
        ],
      ),
    );
  }

  Widget buildControllButton() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      );
  Widget buildResult() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Text(
              barcode != null ? 'Result: ${barcode!.code}' : 'Scan Qr code',
              maxLines: 3,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          (barcode == null)
              ? const SizedBox()
              : BlocConsumer<AbsensiCubit, AbsensiState>(
                  listener: (context, state) {
                    if (state is AbsensiCreateSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main-page', (route) => false);
                    } else if (state is AbsensiCreateFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AbsensiLoading) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30),
                        child: const CircularProgressIndicator(),
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        final result = AbsensiModel(
                            id: "1", jadwal: barcode.toString(), status: true);
                        context.read<AbsensiCubit>().createAbsesnsi(result);
                      },
                      child: Container(
                        width: 200,
                        height: 55,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Absensi Sekarang",
                            style: whiteTextStyleInter,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      );
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQrViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );
  void onQrViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
