import 'package:flutter/cupertino.dart';
import 'package:paypal_app/src/data/contact.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

const fakeContacts = [
  Contact(email: 'j.doe@email.com', name: 'John Doe'),
  Contact(email: 'bob@email.com', name: 'Sponge Bob'),
  Contact(email: 'angelina@email.com', name: 'Angelina Jolie'),
  Contact(email: 'tester@email.com', name: 'Random Tester'),
  Contact(email: 'chris.doe@email.com', name: 'Chris Doe'),
  Contact(email: 'janedoe@email.com', name: 'Jane Doe'),
  Contact(email: 'khabib@email.com', name: 'Khabib'),
  Contact(email: 'joe@email.com', name: 'Joe Canon'),
  Contact(
    email: 'zack@email.com',
    name: 'Zack Snyder',
    profilePicURL:
        'https://m.media-amazon.com/images/M/MV5BMTMzMjUyNjk1MV5BMl5BanBnXkFtZTcwMDc2Mzk3NA@@._V1_.jpg',
  ),
  Contact(email: 'chis-evan@avenger.com', name: 'Chris Evan'),
  Contact(email: 'logan@x-men.com', name: 'Wolverine'),
  Contact(email: 'tonystark@avenger.com', name: 'Tony Stark'),
];

String getInitials({required String string}) {
  var buffer = StringBuffer();
  var split = string.split(' ');
  for (var i = 0; i < (string.split(' ').length); i++) {
    buffer.write(split[i][0]);
  }

  return buffer.toString();
}
