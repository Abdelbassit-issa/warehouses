import 'package:uuid/uuid.dart';

class Asset {
  final String assetId;
  final String name;
  final double monthlyDepreciation;
  final double energyConsumption;
  final double waterConsumption;

  Asset({
    String? assetId,
    required this.name,
    required this.monthlyDepreciation,
    required this.energyConsumption,
    required this.waterConsumption,
  }) : assetId = assetId ?? const Uuid().v4();

  // Convert Asset to Map (for JSON or database storage)
  Map<String, dynamic> toMap() {
    return {
      'asset_id': assetId,
      'name': name,
      'monthly_depreciation': monthlyDepreciation,
      'energy_consumption': energyConsumption,
      'water_consumption': waterConsumption,
    };
  }

  // Create Asset from Map (from JSON or database)
  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      assetId: map['asset_id'],
      name: map['name'],
      monthlyDepreciation: map['monthly_depreciation'].toDouble(),
      energyConsumption: map['energy_consumption'].toDouble(),
      waterConsumption: map['water_consumption'].toDouble(),
    );
  }

  // CopyWith method for immutability
  Asset copyWith({
    String? assetId,
    String? name,
    double? monthlyDepreciation,
    double? energyConsumption,
    double? waterConsumption,
  }) {
    return Asset(
      assetId: assetId ?? this.assetId,
      name: name ?? this.name,
      monthlyDepreciation: monthlyDepreciation ?? this.monthlyDepreciation,
      energyConsumption: energyConsumption ?? this.energyConsumption,
      waterConsumption: waterConsumption ?? this.waterConsumption,
    );
  }

  @override
  String toString() {
    return 'Asset(assetId: $assetId, name: $name, monthlyDepreciation: $monthlyDepreciation, energyConsumption: $energyConsumption, waterConsumption: $waterConsumption)';
  }
}
