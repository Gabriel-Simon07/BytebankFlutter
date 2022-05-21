import 'package:flutter/material.dart';
import 'package:mobile/models/contact.dart';

import '../database/dao/contact_dao/contact_dao.dart';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New contact'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full name'
                ),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                labelText: 'Account number'
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'), onPressed: () {
                    String fullName = _nameController.text;
                    final int? accountNumber = int.tryParse(_accountNumberController.text);

                    if(fullName != null && accountNumber != null) {
                       final Contact newContact = Contact(0, fullName, accountNumber);
                       _dao.save(newContact).then((id) => Navigator.pop(context, newContact));
                    }
                },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
