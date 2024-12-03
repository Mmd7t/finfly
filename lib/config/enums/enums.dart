enum BtnType { withIcon, withoutIcon }

enum AuthType { login, signup, resetPassword, validateEmail }

enum OrderStatusTypes {
  returned,
  delivered,
  ordered;

  String toJson() => name;
  static OrderStatusTypes fromJson(String json) =>
      values.byName(json.toLowerCase());
}
