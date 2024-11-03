import 'package:developer_test/models/offering_model.dart';
import 'package:developer_test/widgets/components/default_text_form_field.dart';
import 'package:flutter/material.dart';

class AddOfferingScreen extends StatefulWidget {
  const AddOfferingScreen({super.key});

  @override
  State<AddOfferingScreen> createState() => _AddOfferingScreenState();
}

class _AddOfferingScreenState extends State<AddOfferingScreen> {
  final List<OfferingModel> offerings = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String? selectedCategory; // For the dropdown
  String? selectedType; // For the radio buttons

  void _addOffering() {
    setState(() {
      offerings.add(
        OfferingModel(
          name: nameController.text,
          title: titleController.text,
          category: selectedCategory ?? '', // Use the selected category
          type: selectedType ?? '', // Use the selected type
          duration: durationController.text,
          price: priceController.text,
          description: descriptionController.text,
        ),
      );
      _clearTextFields();
    });
    Navigator.of(context).pop();
  }

  void _clearTextFields() {
    nameController.clear();
    titleController.clear();
    durationController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedCategory = null; // Reset category
    selectedType = null; // Reset type
  }

  Future<void> _showAddDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Offering'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTextFormField(
                    controller: nameController, hintText: 'Name'),
                DefaultTextFormField(
                    controller: titleController, hintText: 'Title'),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: ['Spiritual', 'Mental', 'Emotional']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                Row(
                  children: [
                    const Text('Type:'),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'In-Person',
                            groupValue: selectedType,
                            onChanged: (val) {
                              setState(() {
                                selectedType = val;
                              });
                            },
                          ),
                          const Text('In-Person'),
                          Radio<String>(
                            value: 'Online',
                            groupValue: selectedType,
                            onChanged: (val) {
                              setState(() {
                                selectedType = val;
                              });
                            },
                          ),
                          const Text('Online'),
                        ],
                      ),
                    ),
                  ],
                ),
                DefaultTextFormField(
                    controller: durationController, hintText: 'Duration'),
                DefaultTextFormField(
                    controller: priceController, hintText: 'Price'),
                DefaultTextFormField(
                    controller: descriptionController, hintText: 'Description'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _addOffering,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offerings Table'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Select')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Title')),
            DataColumn(label: Text('Category')),
            DataColumn(label: Text('Type')),
            DataColumn(label: Text('Duration')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Description')),
            DataColumn(label: Text('Actions')),
          ],
          rows: offerings.map((offering) {
            return DataRow(
              cells: [
                DataCell(Checkbox(
                  value: offering.completed,
                  onChanged: (value) {
                    _toggleCompletion(offering);
                  },
                )),
                DataCell(Text(offering.name)),
                DataCell(Text(offering.title)),
                DataCell(Text(offering.category)),
                DataCell(Text(offering.type)),
                DataCell(Text(offering.duration)),
                DataCell(Text(offering.price)),
                DataCell(Text(offering.description)),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showEditDialog(offering);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteOffering(offering);
                      },
                    ),
                  ],
                )),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'Add Offering',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _toggleCompletion(OfferingModel offering) {
    setState(() {
      offering.completed = !offering.completed;
    });
  }

  void _deleteOffering(OfferingModel offering) {
    setState(() {
      offerings.remove(offering);
    });
  }

  Future<void> _showEditDialog(OfferingModel offering) async {
    // Populate the text fields with the offering's current data
    nameController.text = offering.name;
    titleController.text = offering.title;
    selectedCategory = offering.category; // Set the selected category
    selectedType = offering.type; // Set the selected type
    durationController.text = offering.duration;
    priceController.text = offering.price;
    descriptionController.text = offering.description;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Offering'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTextFormField(
                    controller: nameController, hintText: 'Name'),
                DefaultTextFormField(
                    controller: titleController, hintText: 'Title'),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: ['Spiritual', 'Mental', 'Emotional']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                Row(
                  children: [
                    const Text('Type:'),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'In-Person',
                            groupValue: selectedType,
                            onChanged: (val) {
                              setState(() {
                                selectedType = val;
                              });
                            },
                          ),
                          const Text('In-Person'),
                          Radio<String>(
                            value: 'Online',
                            groupValue: selectedType,
                            onChanged: (val) {
                              setState(() {
                                selectedType = val;
                              });
                            },
                          ),
                          const Text('Online'),
                        ],
                      ),
                    ),
                  ],
                ),
                DefaultTextFormField(
                    controller: durationController, hintText: 'Duration'),
                DefaultTextFormField(
                    controller: priceController, hintText: 'Price'),
                DefaultTextFormField(
                    controller: descriptionController, hintText: 'Description'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save edited offering
                offering.name = nameController.text;
                offering.title = titleController.text;
                offering.category = selectedCategory ?? '';
                offering.type = selectedType ?? '';
                offering.duration = durationController.text;
                offering.price = priceController.text;
                offering.description = descriptionController.text;

                // Reset fields and close dialog
                _clearTextFields();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
