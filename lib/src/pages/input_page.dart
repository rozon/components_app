import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _date = "";
  List<String> _accountTypes = [
    "User",
    "Admin",
    "CEO",
    "Delivery",
    "Superuser",
    "Invited",
  ];
  String _accountTypeValue = "User";
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _selectAccountType(),
          Divider(),
          _createUser(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text("Characters ${_name.length}"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Name",
        labelText: "Name",
        helperText: "It's just the name",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() => _name = value);
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Email",
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _createUser() {
    return ListTile(
      title: Text("Name: $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text("User Type: $_accountTypeValue"),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Password",
        labelText: "Password",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Birthday",
        labelText: "Birthday",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateFormat dateFormat = DateFormat("MM-dd-yyyy");
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2025));

    if (selectedDate != null) {
      setState(() {
        _date = dateFormat.format(selectedDate);
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _selectAccountType() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
          value: _accountTypeValue,
          items: getAccountTypeOptions(),
          onChanged: (option) {
            setState(() {
              _accountTypeValue = option;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getAccountTypeOptions() {
    List<DropdownMenuItem<String>> optionList = List();

    _accountTypes.forEach((option) {
      optionList.add(DropdownMenuItem(
        child: Text(option),
        value: option,
      ));
    });

    return optionList;
  }
}
