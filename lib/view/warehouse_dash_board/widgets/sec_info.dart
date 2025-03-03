import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:warehouses/models/vendors_model.dart';

import '../../../models/assets_model.dart';

Widget secInfoDialog({
  required Map<String, dynamic> sec,
  required String secName,
}) {
  log(sec.toString());
  switch (secName) {
    case 'vendors':
      final vendor = VendorModel.fromMap(sec);
      return AlertDialog(
        title: Text('Security Information'),
        content: Column(
          children: [
            Text(
              'المورد: ${vendor.name}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
            const SizedBox(height: 34),
            Text(
              'العنوان: ${vendor.address}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
            const SizedBox(height: 34),
            Text(
              'الهاتف: ${vendor.contact}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
            const SizedBox(height: 34),
            Text(
              'رقم السجل التجاري: ${vendor.crNumber}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
            const SizedBox(height: 34),
            Text(
              'الرقم الضريبي: ${vendor.vatNumber}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
            const SizedBox(height: 34),
            Text(
              'البريد الالكتروني: ${vendor.email}',
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color: Colors.blueGrey.shade800),
            ),
          ],
        ),
        actions: [Text('Close')],
      );
    case 'assets':
      final asset = Asset.fromMap(sec);
      return AlertDialog(
        title: Center(child: Text('أصول')),
        content: Column(
          children: [
            Text(
              'الأصل: ${asset.name}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,

              style: TextStyle(fontSize: 18.0, color:Colors.blueGrey.shade800),
            ),
          ],
        ),
        actions: [Text('Close')],
      );
    case 'raw_materials':
      return AlertDialog(
        title: Text('Security Information'),
        content: Column(children: [Text(sec.toString())]),
        actions: [Text('Close')],
      );
    default:
      return AlertDialog(
        title: Text('Security Information'),
        content: Column(children: [Text('Nothing to do here for now ')]),
        actions: [Text('Close')],
      );
  }
}
