class User {
  String? message;
  String? token;
  UserClass? user;

  User({
    this.message,
    this.token,
    this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        message: json["message"],
        token: json["token"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user!.toJson(),
      };
}

class UserClass {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  dynamic phone;
  String? provider;
  DateTime? emailVerifiedAt;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  dynamic parentId;
  List<Subscription>? subscriptions;
  Configuration? configuration;
  List<Role>? roles;

  UserClass({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.provider,
    this.emailVerifiedAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.subscriptions,
    this.configuration,
    this.roles,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        provider: json["provider"],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : null,
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        parentId: json["parent_id"],
        subscriptions: List<Subscription>.from(
            json["subscriptions"].map((x) => Subscription.fromJson(x))),
        configuration: Configuration.fromJson(json["configuration"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "provider": provider,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "parent_id": parentId,
        "subscriptions":
            List<dynamic>.from(subscriptions!.map((x) => x.toJson())),
        "configuration": configuration!.toJson(),
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Configuration {
  String? id;
  String? userId;
  String? timezone;
  String? currency;
  String? locale;
  String? createdAt;
  String? updatedAt;

  Configuration({
    this.id,
    this.userId,
    this.timezone,
    this.currency,
    this.locale,
    this.createdAt,
    this.updatedAt,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        id: json["id"],
        userId: json["user_id"],
        timezone: json["timezone"],
        currency: json["currency"],
        locale: json["locale"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "timezone": timezone,
        "currency": currency,
        "locale": locale,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Role {
  String? name;
  RolePivot? pivot;

  Role({
    this.name,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["name"],
        pivot: RolePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pivot": pivot!.toJson(),
      };
}

class RolePivot {
  String? userId;
  String? roleId;

  RolePivot({
    this.userId,
    this.roleId,
  });

  factory RolePivot.fromJson(Map<String, dynamic> json) => RolePivot(
        userId: json["user_id"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role_id": roleId,
      };
}

class Subscription {
  String? id;
  String? name;
  String? slug;
  String? type;
  String? description;
  int? price;
  dynamic salePrice;
  int? platformFee;
  String? platformFeeType;
  int? status;
  String? createdAt;
  String? updatedAt;
  SubscriptionPivot? pivot;

  Subscription({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.description,
    this.price,
    this.salePrice,
    this.platformFee,
    this.platformFeeType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        type: json["type"],
        description: json["description"],
        price: json["price"],
        salePrice: json["sale_price"],
        platformFee: json["platform_fee"],
        platformFeeType: json["platform_fee_type"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: SubscriptionPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "type": type,
        "description": description,
        "price": price,
        "sale_price": salePrice,
        "platform_fee": platformFee,
        "platform_fee_type": platformFeeType,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot!.toJson(),
      };
}

class SubscriptionPivot {
  String? userId;
  String? subscriptionId;
  DateTime? expiresOn;

  SubscriptionPivot({
    this.userId,
    this.subscriptionId,
    this.expiresOn,
  });

  factory SubscriptionPivot.fromJson(Map<String, dynamic> json) =>
      SubscriptionPivot(
        userId: json["user_id"],
        subscriptionId: json["subscription_id"],
        expiresOn: DateTime.parse(json["expires_on"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "subscription_id": subscriptionId,
        "expires_on": expiresOn!.toIso8601String(),
      };
}
