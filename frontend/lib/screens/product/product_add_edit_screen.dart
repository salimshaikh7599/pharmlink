import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductAddEditScreen extends StatefulWidget {
  final Product? product;

  const ProductAddEditScreen({Key? key, this.product}) : super(key: key);

  @override
  _ProductAddEditScreenState createState() => _ProductAddEditScreenState();
}

class _ProductAddEditScreenState extends State<ProductAddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _mrpController;
  late TextEditingController _genericController;
  late TextEditingController _usesController;
  late TextEditingController _sideEffectsController;
  late TextEditingController _interactionsController;
  bool _prescriptionRequired = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.productName);
    _mrpController = TextEditingController(text: widget.product?.mrp?.toString());
    _genericController = TextEditingController(text: widget.product?.generic);
    _usesController = TextEditingController(text: widget.product?.uses);
    _sideEffectsController = TextEditingController(text: widget.product?.sideEffects);
    _interactionsController = TextEditingController(text: widget.product?.interactions);
    _prescriptionRequired = widget.product?.prescriptionRequired ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter product name' : null,
              ),
              TextFormField(
                controller: _mrpController,
                decoration: InputDecoration(labelText: 'MRP'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter MRP' : null,
              ),
              TextFormField(
                controller: _genericController,
                decoration: InputDecoration(labelText: 'Generic Name'),
              ),
              TextFormField(
                controller: _usesController,
                decoration: InputDecoration(labelText: 'Uses'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _sideEffectsController,
                decoration: InputDecoration(labelText: 'Side Effects'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _interactionsController,
                decoration: InputDecoration(labelText: 'Interactions'),
                maxLines: 3,
              ),
              CheckboxListTile(
                title: Text('Prescription Required'),
                value: _prescriptionRequired,
                onChanged: (bool? value) {
                  setState(() {
                    _prescriptionRequired = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text('Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProduct() async {
    if (_formKey.currentState?.validate() ?? false) {
      final productData = {
        if (widget.product != null) 'product_id': widget.product!.productId,
        'product_name': _nameController.text,
        'mrp': double.parse(_mrpController.text),
        'generic': _genericController.text,
        'uses': _usesController.text,
        'side_effects': _sideEffectsController.text,
        'interactions': _interactionsController.text,
        'prescription_required': _prescriptionRequired ? 1 : 0,
      };

      try {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        if (widget.product == null) {
          await productProvider.addProduct(productData);
        } else {
          await productProvider.updateProduct(
              widget.product!.productId, productData);
        }
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving product: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mrpController.dispose();
    _genericController.dispose();
    _usesController.dispose();
    _sideEffectsController.dispose();
    _interactionsController.dispose();
    super.dispose();
  }
}