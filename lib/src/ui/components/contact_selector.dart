import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:paypal_app/src/data/contact.dart';
import 'package:paypal_app/src/utils/constants.dart';
import 'package:paypal_app/src/utils/styles.dart';

class ContactSelector extends StatelessWidget {
  const ContactSelector({required this.onSelect, Key? key}) : super(key: key);

  final void Function(Contact) onSelect;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      onClosing: () => Navigator.pop(context),
      builder: (context) => ListView.builder(
        itemCount: fakeContacts.length,
        itemBuilder: (context, index) {
          var contact = fakeContacts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
            child: ListTile(
              onTap: () {
                onSelect(contact);
                Navigator.of(context).pop();
              },
              tileColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              leading: contact.profilePicURL == null
                  ? CircleAvatar(
                      backgroundColor: AppColors.dark.withOpacity(0.2),
                      child: Icon(
                        EvaIcons.person,
                        color: AppColors.white,
                      ),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(contact.profilePicURL!),
                    ),
              title: Text(contact.name),
              subtitle: Text(contact.email),
            ),
          );
        },
      ),
    );
  }
}
