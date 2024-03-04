class Company {
  final String? id;
  final String? name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic logo;

  Company({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "logo": logo,
      };
}
