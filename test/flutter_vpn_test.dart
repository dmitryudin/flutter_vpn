import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:flutter_vpn/flutter_vpn_platform_interface.dart';
import 'package:flutter_vpn/flutter_vpn_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterVpnPlatform
    with MockPlatformInterfaceMixin
    implements FlutterVpnPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterVpnPlatform initialPlatform = FlutterVpnPlatform.instance;

  test('$MethodChannelFlutterVpn is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterVpn>());
  });

  test('getPlatformVersion', () async {
    FlutterVpn flutterVpnPlugin = FlutterVpn();
    MockFlutterVpnPlatform fakePlatform = MockFlutterVpnPlatform();
    FlutterVpnPlatform.instance = fakePlatform;

    expect(await flutterVpnPlugin.getPlatformVersion(), '42');
  });
}
