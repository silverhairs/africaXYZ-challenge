import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  const Contact({
    required this.email,
    required this.name,
    this.profilePicURL,
  });
  final String name;
  final String? profilePicURL;
  final String email;

  @override
  List<Object?> get props => [email, name, profilePicURL];

  static const empty = Contact(email: '', name: '');

  bool get isEmpty => this == Contact.empty;
  bool get isNotEmpty => this != Contact.empty;
}
