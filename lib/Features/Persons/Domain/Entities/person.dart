// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Person {
  String id;
  String name;
  String email;
  String address;
  Person({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  Person copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(id: $id, name: $name, email: $email, address: $address)';
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      address.hashCode;
  }
}
