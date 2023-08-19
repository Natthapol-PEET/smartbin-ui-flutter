class WasteModel {
  int? can;
  int? plastic;
  int? pet;
  int? trash;

  WasteModel({this.can, this.plastic, this.pet, this.trash});

  WasteModel.fromJson(Map<String, dynamic> json) {
    can = json['can'];
    plastic = json['plastic'];
    pet = json['pet'];
    trash = json['trash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['can'] = can;
    data['plastic'] = plastic;
    data['pet'] = pet;
    data['trash'] = trash;
    return data;
  }
}
