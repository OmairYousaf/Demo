import 'package:demo/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateCarScreen extends StatefulWidget {
  CreateCarScreen(this.model, {super.key}) {
    print(model);
  }
  CarModel? model;
  String? selectedColorValue = 'Select Color';
  String? selectedModelValue = 'Select Model';
  String? regNo = '';
  String? category = '';
  List<String> colors = [
    'Select Color',
    'White',
    'Black',
    'Red',
    'Grey',
    'Blue'
  ];
  List<String> models = [
    'Select Model',
    'Civic',
    'Highlander',
    'Golf',
    '911',
    'Accord',
  ];

  @override
  State<CreateCarScreen> createState() => _CreateCarScreenState();
}

class _CreateCarScreenState extends State<CreateCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarForm>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Center(child: Text(widget.model == null ? 'Create' : 'Update')),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 75, 10, 0),
                child: Form(
                  key: provider.loginformKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: const Color(0xff363636)),
                              borderRadius: BorderRadius.circular(8),
                              // boxShadow: EncoreStyles.cardShadow,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                      validator: provider.colorValidator,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      value: widget.model == null
                                          ? widget.selectedColorValue
                                          : widget.model!.color,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          if (widget.model != null) {
                                            widget.model!.color = newValue!;
                                          } else {
                                            widget.selectedColorValue =
                                                newValue!;
                                          }
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/icons/down_arrow.svg'),
                                      iconSize: 24,
                                      style: const TextStyle(
                                          color: Color(0xffAFAEAE),
                                          fontSize: 16),
                                      isExpanded: true,
                                      items: widget.colors
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          onSaved: (newValue) {
                            if (widget.model != null) {
                              provider.onRegNoSaved(widget.model!, newValue);
                            } else {
                              widget.regNo = newValue;
                            }
                          },
                          validator: provider.regNoValidator,
                          initialValue: widget.model == null
                              ? ''
                              : widget.model!.registrationNo!,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Registration No',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          onSaved: (newValue) {
                            if (widget.model != null) {
                              provider.onCategorySaved(widget.model!, newValue);
                            } else {
                              widget.category = newValue;
                            }
                          },
                          validator: provider.categoryValidator,
                          initialValue: widget.model == null
                              ? ''
                              : widget.model!.category!,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Category',
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: const Color(0xff363636)),
                              borderRadius: BorderRadius.circular(8),
                              // boxShadow: EncoreStyles.cardShadow,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                      validator: provider.modelValidator,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                      value: widget.model == null
                                          ? widget.selectedModelValue
                                          : widget.model!.model,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          if (widget.model != null) {
                                            widget.model!.model = newValue!;
                                          } else {
                                            widget.selectedModelValue =
                                                newValue!;
                                          }
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/icons/down_arrow.svg'),
                                      iconSize: 24,
                                      style: const TextStyle(
                                          color: Color(0xffAFAEAE),
                                          fontSize: 16),
                                      isExpanded: true,
                                      items: widget.models
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 75),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child:
                                Text(widget.model == null ? 'Add' : 'Update'),
                            onPressed: () {
                              provider.loginformKey.currentState!.save();
                              if (provider.loginformKey.currentState!
                                  .validate()) {
                                print(widget.model);

                                Navigator.pop(
                                    context,
                                    widget.model ??
                                        CarModel(
                                            color: widget.selectedColorValue,
                                            registrationNo: widget.regNo,
                                            category: widget.category,
                                            model: widget.selectedModelValue));
                              }
                            },
                          )),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            provider.username,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                    ],
                  ),
                ))),
      );
    });
  }
}
