import 'package:supabase_flutter/supabase_flutter.dart';

final class RootConnection {
  static RootConnection? _connection;
  final SupabaseClient supabaseClient;
  RootConnection._({required this.supabaseClient});
  factory RootConnection.getConnection() {
    if (_connection == null) {
      
      _connection = RootConnection._(supabaseClient: Supabase.instance.client);
      return _connection!;
    }
    return _connection!;
  }
}
