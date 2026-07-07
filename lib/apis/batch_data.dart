class BatchData {
  BatchData({
    List<Batch>? data,
  }) {
    _data = data;
  }

  BatchData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Batch.fromJson(v));
      });
    }
  }

  List<Batch>? _data;

  BatchData copyWith({
    bool? status,
    List<Batch>? data,
  }) =>
      BatchData(
        data: data ?? _data,
      );

  List<Batch>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Bat_id : "1055"
/// batch_name : "MP PATWARI MCQ"
/// batch_fee : "0"
/// batch_time : ""
/// batch_date : ""
/// batch_location : "jodhpur"

class Batch {
  Batch({
    String? batId,
    String? batchName,
    String? batchFee,
    String? batchTime,
    String? batchDate,
    String? batchLocation,
  }) {
    _batId = batId;
    _batchName = batchName;
    _batchFee = batchFee;
    _batchTime = batchTime;
    _batchDate = batchDate;
    _batchLocation = batchLocation;
  }

  Batch.fromJson(dynamic json) {
    _batId = json['Bat_id'];
    _batchName = json['batch_name'];
    _batchFee = json['batch_fee'];
    _batchTime = json['batch_time'];
    _batchDate = json['batch_date'];
    _batchLocation = json['batch_location'];
  }

  String? _batId;
  String? _batchName;
  String? _batchFee;
  String? _batchTime;
  String? _batchDate;
  String? _batchLocation;

  Batch copyWith({
    String? batId,
    String? batchName,
    String? batchFee,
    String? batchTime,
    String? batchDate,
    String? batchLocation,
  }) =>
      Batch(
        batId: batId ?? _batId,
        batchName: batchName ?? _batchName,
        batchFee: batchFee ?? _batchFee,
        batchTime: batchTime ?? _batchTime,
        batchDate: batchDate ?? _batchDate,
        batchLocation: batchLocation ?? _batchLocation,
      );

  String? get batId => _batId;

  String? get batchName => _batchName;

  String? get batchFee => _batchFee;

  String? get batchTime => _batchTime;

  String? get batchDate => _batchDate;

  String? get batchLocation => _batchLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Bat_id'] = _batId;
    map['batch_name'] = _batchName;
    map['batch_fee'] = _batchFee;
    map['batch_time'] = _batchTime;
    map['batch_date'] = _batchDate;
    map['batch_location'] = _batchLocation;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Batch &&
          runtimeType == other.runtimeType &&
          _batId == other._batId;

  @override
  int get hashCode => _batId.hashCode;
}
