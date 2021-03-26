class PostReviewProductBody {
  int rate;
  String text;

  PostReviewProductBody({this.rate, this.text});

  PostReviewProductBody.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['text'] = this.text;
    return data;
  }
}
