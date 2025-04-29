import 'package:flutter/material.dart';

void main() => runApp(const SimuladorApp());

class SimuladorApp extends StatelessWidget {
  const SimuladorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simulador de Crédito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const DatosContactoPage(),
    );
  }
}

class DatosContactoPage extends StatefulWidget {
  const DatosContactoPage({super.key});

  @override
  State<DatosContactoPage> createState() => _DatosContactoPageState();
}

class _DatosContactoPageState extends State<DatosContactoPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'micorreo@gmail.com');
  final _celularController = TextEditingController(text: '984938499');
  final _ventasController = TextEditingController(text: '1260.00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B8C),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hola Elmo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Para comenzar completa tu información'),
                const SizedBox(height: 24),
                const Text('Datos de contacto',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Ingrese un correo válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _celularController,
                  decoration: const InputDecoration(
                    labelText: 'Celular',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length < 9) {
                      return 'Ingrese un número válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ventasController,
                  decoration: const InputDecoration(
                    labelText: 'Ventas mensuales',
                    prefixText: 'S/ ',
                    helperText: 'Mínimo S/ 1,000 | Máximo S/ 900,000',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final monto = double.tryParse(value ?? '');
                    if (monto == null || monto < 1000 || monto > 900000) {
                      return 'El monto debe estar entre 1,000 y 900,000';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'El monto de ventas será redondeada a la cifra más cercana.',
                          style: TextStyle(fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Datos validados correctamente')),
                        );
                      }
                    },
                    child: const Text('Continuar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
