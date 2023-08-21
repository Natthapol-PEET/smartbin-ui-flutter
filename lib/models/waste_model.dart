class WasteModel {
  int? status;
  Data? data;

  WasteModel({this.status, this.data});

  WasteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? can;
  int? pet;
  int? plastic;
  int? unknown;

  Data({this.can, this.pet, this.plastic, this.unknown});

  Data.fromJson(Map<String, dynamic> json) {
    can = json['can'];
    pet = json['pet'];
    plastic = json['plastic'];
    unknown = json['unknown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['can'] = can;
    data['pet'] = pet;
    data['plastic'] = plastic;
    data['unknown'] = unknown;
    return data;
  }
}
