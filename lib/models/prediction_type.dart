class PredictType {
  int? id;
  double? score;

  PredictType({this.id, this.score});

  PredictType.fromJson(Map<String, dynamic> json) {
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
