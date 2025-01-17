import 'package:mi_reclamo/features/domain/entities/enum/StatusEnum.dart';
import 'package:mi_reclamo/features/domain/entities/enum/TypesEnum.dart';

class Category {
  final String token;
  final String name;
  final String description;

  Category({
    required this.token,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      token: json['token'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
      'description': description,
    };
  }
  @override
  String toString() {
    return 'Category{token: $token, name: $name, description: $description}';
  }
}

class Ticket {
  final Types type;
  final String subject;
  final String message;
  final Category category;
  final String token;
  final Status status;
  final DateTime created;
  final DateTime updated;
  final String? response;

  Ticket({
    required this.type,
    required this.subject,
    required this.message,
    required this.category,
    required this.token,
    required this.status,
    required this.created,
    required this.updated,
    required this.response,
  });

  Ticket copyWith({
    Types? type,
    String? subject,
    String? message,
    Category? category,
    String? token,
    Status? status,
    DateTime? created,
    DateTime? updated,
    String? response,
  }) {
    return Ticket(
      type: type ?? this.type,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      category: category ?? this.category,
      token: token ?? this.token,
      status: status ?? this.status,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      response: response ?? this.response,
    );
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      type: TypesExtension.fromString(json['type']),
      subject: json['subject'],
      message: json['message'],
      category: Category.fromJson(json['category']),
      token: json['token'],
      status: StatusExtension.fromString(json['status']),
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      response: json['response'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'subject': subject,
      'message': message,
      'category': category.toJson(),
      'token': token,
      'status': status.name,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
      'response': response,
    };
  }

  @override
  String toString() {
    return 'Ticket{type: ${type.name}, subject: $subject, message: $message, category: ${category.toString()}, token: $token, status: ${status.name}, created: $created, updated: $updated, response: $response}';
  }

}

