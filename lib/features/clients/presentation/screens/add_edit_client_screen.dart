import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/client.dart';
import '../providers/client_provider.dart';

class AddEditClientScreen extends ConsumerStatefulWidget {
  final Client? client;
  const AddEditClientScreen({super.key, this.client});

  @override
  ConsumerState<AddEditClientScreen> createState() => _AddEditClientScreenState();
}

class _AddEditClientScreenState extends ConsumerState<AddEditClientScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  String? _school;
  String? _parentName;
  String? _parentPhone;

  @override
  void initState() {
    super.initState();
    _name = widget.client?.name ?? '';
    _school = widget.client?.school;
    _parentName = widget.client?.parentName;
    _parentPhone = widget.client?.parentPhone;
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newClient = Client()
        ..name = _name
        ..school = _school
        ..parentName = _parentName
        ..parentPhone = _parentPhone;

      if (widget.client != null) {
        newClient.id = widget.client!.id;
        newClient.currentDebt = widget.client!.currentDebt;
        ref.read(clientsNotifierProvider.notifier).updateClient(newClient);
      } else {
        ref.read(clientsNotifierProvider.notifier).addClient(newClient);
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.client == null ? 'Nuevo Niño' : 'Editar Niño'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Nombre del Niño *'),
                validator: (value) => value == null || value.isEmpty ? 'Requerido' : null,
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _school,
                decoration: const InputDecoration(labelText: 'Escuela / Grado'),
                onSaved: (value) => _school = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _parentName,
                decoration: const InputDecoration(labelText: 'Nombre del Padre/Madre'),
                onSaved: (value) => _parentName = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _parentPhone,
                decoration: const InputDecoration(labelText: 'Teléfono del Padre/Madre'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => _parentPhone = value,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
