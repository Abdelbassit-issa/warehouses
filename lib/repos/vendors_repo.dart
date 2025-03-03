import 'dart:developer';

import 'package:warehouses/data/parts.dart';
import 'package:warehouses/repos/connections/root_conn.dart';


Future<List<Map<String, dynamic>>?> getSection({required String tableName}) async {
  try {
    final conn = RootConnection.getConnection().supabaseClient;
    final response = await conn.from(tableName).select('*');

    if (response.isNotEmpty) {
      return response;
    }
  } on Exception catch (e) {
    log('Error getting vendors: $e');
  }
  return vendors;
}
