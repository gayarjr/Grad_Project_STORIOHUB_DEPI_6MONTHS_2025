class Session {
  String? url;
  String? successUrl;
  String? cancelUrl;

  Session({this.url, this.successUrl, this.cancelUrl});

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    url: json['url'] as String?,
    successUrl: json['success_url'] as String?,
    cancelUrl: json['cancel_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'success_url': successUrl,
    'cancel_url': cancelUrl,
  };
}
