/// status : 200
/// data : [{"id":"3","title":"Pharmacist","cover_image":""},{"id":"4","title":"Livestock Assistant","cover_image":""},{"id":"5","title":"Agriculture Supervisor","cover_image":""},{"id":"13","title":"SSC","cover_image":""},{"id":"14","title":"IAS","cover_image":""},{"id":"15","title":"Bank","cover_image":""},{"id":"16","title":"CTET","cover_image":""},{"id":"17","title":"Delhi Police","cover_image":""},{"id":"21","title":"Railway","cover_image":""},{"id":"23","title":"3 Year LLB","cover_image":""},{"id":"32","title":"AIR Force","cover_image":""},{"id":"37","title":"NAVY","cover_image":""},{"id":"38","title":"NDA","cover_image":""},{"id":"44","title":"CET","cover_image":""},{"id":"45","title":"Constable","cover_image":""},{"id":"46","title":"Patwari","cover_image":""},{"id":"56","title":"Rajasthan Judicial Services","cover_image":""},{"id":"60","title":"PSC","cover_image":""},{"id":"61","title":"Sub Inspector","cover_image":""},{"id":"62","title":"Forest Guard & Jail Prahari","cover_image":""},{"id":"66","title":"JEE","cover_image":""},{"id":"67","title":"NEET","cover_image":""},{"id":"73","title":"EO / RO","cover_image":""},{"id":"74","title":"RAS","cover_image":""},{"id":"75","title":"Raj Sub Inspector","cover_image":""},{"id":"76","title":"1st Grade (School Lecturer)","cover_image":""},{"id":"77","title":"2nd Grade (Teacher)","cover_image":""},{"id":"78","title":"3rd Grade (Teacher) - REET Mains","cover_image":""},{"id":"81","title":"BSTC","cover_image":""},{"id":"83","title":"Computer Instructor","cover_image":""},{"id":"84","title":"Computor","cover_image":""},{"id":"85","title":"Raj Constable","cover_image":""},{"id":"87","title":"Forester and Forest Guard","cover_image":""},{"id":"89","title":"High Court LDC","cover_image":""},{"id":"90","title":"Information Assistant (IA​)","cover_image":""},{"id":"92","title":"Junior Accountant","cover_image":""},{"id":"94","title":"Lab Assistant","cover_image":""},{"id":"95","title":"LDC","cover_image":""},{"id":"96","title":"Librarian","cover_image":""},{"id":"97","title":"Raj Patwari","cover_image":""},{"id":"98","title":"PTET","cover_image":""},{"id":"99","title":"PTI","cover_image":""},{"id":"100","title":"REET (Pre Exams)","cover_image":""},{"id":"103","title":"VDO","cover_image":""},{"id":"124","title":"PCS","cover_image":""},{"id":"125","title":"RO and ARO","cover_image":""},{"id":"126","title":"UP Sub Inspector","cover_image":""},{"id":"128","title":"UP Constable","cover_image":""},{"id":"129","title":"Forest Guard","cover_image":""},{"id":"133","title":"Junior Assistant","cover_image":""},{"id":"141","title":"परीक्षा","cover_image":""},{"id":"143","title":"MP POLICE SI","cover_image":""},{"id":"144","title":"MPPSC","cover_image":""},{"id":"145","title":"MP TET","cover_image":""},{"id":"146","title":"MP Patwari","cover_image":""},{"id":"147","title":"MP Vanrakshak/Jail Prahari","cover_image":""},{"id":"148","title":"MP constable","cover_image":""},{"id":"150","title":"Women Supervisor","cover_image":""}]

class FilterData {
  FilterData({
      num? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  FilterData.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  List<Data>? _data;
FilterData copyWith({  num? status,
  List<Data>? data,
}) => FilterData(  status: status ?? _status,
  data: data ?? _data,
);
  num? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "3"
/// title : "Pharmacist"
/// cover_image : ""

class Data {
  Data({
      String? id, 
      String? title, 
      String? coverImage,}){
    _id = id;
    _title = title;
    _coverImage = coverImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _coverImage = json['cover_image'];
  }
  String? _id;
  String? _title;
  String? _coverImage;
Data copyWith({  String? id,
  String? title,
  String? coverImage,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  coverImage: coverImage ?? _coverImage,
);
  String? get id => _id;
  String? get title => _title;
  String? get coverImage => _coverImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cover_image'] = _coverImage;
    return map;
  }

}