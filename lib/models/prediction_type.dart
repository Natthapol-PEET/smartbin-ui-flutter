class PredictType {
  int? status;
  Data? data;
  BinDetails? binDetails;

  PredictType({this.status, this.data, this.binDetails});

  PredictType.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    binDetails = json['bin_details'] != null ? BinDetails.fromJson(json['bin_details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (binDetails != null) {
      data['bin_details'] = binDetails!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  double? score;

  Data({this.id, this.score});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['score'] = score;
    return data;
  }
}

class BinDetails {
  int? can;
  int? pet;
  int? plastic;
  int? unknown;

  BinDetails({this.can, this.pet, this.plastic, this.unknown});

  BinDetails.fromJson(Map<String, dynamic> json) {
    can = json['can'];
    pet = json['pet'];
    plastic = json['plastic'];
    unknown = json['unknown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['can'] = this.can;
    data['pet'] = this.pet;
    data['plastic'] = this.plastic;
    data['unknown'] = this.unknown;
    return data;
  }
}
