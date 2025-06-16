import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rasabali1/Home/home_screen.dart';

class CheckoutStepperScreen extends StatefulWidget {
  @override
  State<CheckoutStepperScreen> createState() => _CheckoutStepperScreenState();
}

class _CheckoutStepperScreenState extends State<CheckoutStepperScreen> {
  int currentStep = 0;
  int totalSteps = 5;
  final _formKey = GlobalKey<FormState>();

  // Controllers for "About You"
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  String selectedState = 'Maharashtra';
  bool subscribe = false;
  bool createAccount = false;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController deliveryDateController = TextEditingController();
  final TextEditingController cardMessageController = TextEditingController();

  String? selectedSlot;

  List<String> states = ['Maharashtra', 'Delhi', 'Karnataka', 'Tamil Nadu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xfff4ab3c),
        elevation: 1,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildStepsIndicator(),
            Divider(),
            Expanded(
              child: StepperContent(
                step: currentStep,
                formKey: _formKey,
                fullNameController: fullNameController,
                phoneController: phoneController,
                emailController: emailController,
                pinCodeController: pinCodeController,
                selectedState: selectedState,
                onStateChanged: (value) =>
                    setState(() => selectedState = value),
                subscribe: subscribe,
                onSubscribeChanged: (val) => setState(() => subscribe = val),
                createAccount: createAccount,
                onCreateAccountChanged: (val) =>
                    setState(() => createAccount = val),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfff4ab3c),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  try {
                    if (currentStep == 0) {
                      // Only validate the form on step 0
                      if (!(_formKey.currentState?.validate() ?? false)) {
                        return;
                      }
                    }
                    if (currentStep < totalSteps - 1) {
                      setState(() => currentStep += 1);
                    } else {
                      print("Order submitted");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }
                  } catch (e) {
                    log('Form validation error: $e');
                  }
                },
                child: Text(
                  currentStep == totalSteps - 1 ? "Submit" : "Next →",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            FooterNote(),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsIndicator() {
    List<String> steps = [
      "About You",
      "Shipping Address",
      "Delivery Details",
      "Review Order",
      "Payment & Confirmation"
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double itemWidth = constraints.maxWidth / steps.length;

          return Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(steps.length, (index) {
              bool isActive = currentStep >= index;

              return Container(
                width: itemWidth,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor:
                          isActive ? Color(0xfff4ab3c) : Colors.grey.shade300,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: currentStep == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class StepperContent extends StatefulWidget {
  final int step;
  final GlobalKey<FormState> formKey;

  // About You
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController pinCodeController;
  final String selectedState;
  final Function(String) onStateChanged;
  final bool subscribe;
  final bool createAccount;
  final Function(bool) onSubscribeChanged;
  final Function(bool) onCreateAccountChanged;

  StepperContent({
    required this.step,
    required this.formKey,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.pinCodeController,
    required this.selectedState,
    required this.onStateChanged,
    required this.subscribe,
    required this.createAccount,
    required this.onSubscribeChanged,
    required this.onCreateAccountChanged,
  });

  @override
  State<StepperContent> createState() => _StepperContentState();
}

class _StepperContentState extends State<StepperContent> {
  String selectedPaymentMethod = "Credit Card";

  // Step 2 & 3 Controllers
  final TextEditingController deliveryCityController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController senderNameController = TextEditingController();

  final TextEditingController cardMessageController = TextEditingController();

  final TextEditingController cookingInstructionsController =
      TextEditingController();

  final TextEditingController deliveryDateController = TextEditingController();

  final List<String> deliveryOccasions = [
    'Birthday',
    'Anniversary',
    'Thank You',
    'Congratulations'
  ];

  final List<String> deliverySlots = ['Morning', 'Afternoon', 'Evening'];

  String selectedOccasion = 'Birthday';

  String selectedSlot = 'Morning';

  String deliveryType = 'Home';

  @override
  Widget build(BuildContext context) {
    switch (widget.step) {
      case 0:
        return _buildStep1AboutYou();
      case 1:
        return _buildStep2ShippingAddress();
      case 2:
        return _buildStep3DeliveryDetails();
      case 3:
        return _buildStep4ReviewOrder();
      case 4:
        return _buildStep5PaymentConfirmation();
      default:
        return Center(
          child: Text("Step ${widget.step + 1} Content"),
        );
    }
  }

  Widget _buildStep5PaymentConfirmation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("Payment & Confirmation",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 16),
          Text(
            "Select Payment Method",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          RadioListTile(
            value: "Credit Card",
            groupValue: selectedPaymentMethod,
            onChanged: (val) {
              setState(() => selectedPaymentMethod = val!);
            },
            title: Text("Credit Card"),
          ),
          RadioListTile(
            value: "UPI",
            groupValue: "Credit Card",
            onChanged: (val) {},
            title: Text("UPI"),
          ),
          RadioListTile(
            value: "Cash on Delivery",
            groupValue: "Credit Card",
            onChanged: (val) {},
            title: Text("Cash on Delivery"),
          ),
          SizedBox(height: 24),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Color(0xfff4ab3c),
          //     minimumSize: Size(double.infinity, 50),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(25)),
          //   ),
          //   onPressed: () {},
          //   child: Text("Confirm & Pay", style: TextStyle(color: Colors.black)),
          // ),
        ],
      ),
    );
  }

  Widget _buildStep4ReviewOrder() {
    // Ensure that all controllers and variables are initialized
    final fullNameText = widget.fullNameController.text ?? "";
    final addressText = addressController.text ?? "";
    final deliveryDateText = deliveryDateController.text ?? "";
    final cardMessageText = cardMessageController.text ?? "";
    final deliverySlot = selectedSlot ?? "Not selected";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            "Review Order",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 16),

          // Recipient
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Recipient"),
              subtitle:
                  Text(fullNameText.isNotEmpty ? fullNameText : "Not provided"),
            ),
          ),

          // Shipping Address
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Shipping Address"),
              subtitle:
                  Text(addressText.isNotEmpty ? addressText : "Not provided"),
            ),
          ),

          // Delivery Date
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Delivery Date"),
              subtitle: Text(deliveryDateText.isNotEmpty
                  ? deliveryDateText
                  : "Not selected"),
            ),
          ),

          // Delivery Slot
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Delivery Slot"),
              subtitle: Text(deliverySlot),
            ),
          ),

          // Message on Card
          Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Message on Card"),
              subtitle:
                  Text(cardMessageText.isNotEmpty ? cardMessageText : "None"),
            ),
          ),

          SizedBox(height: 16),

          // Order Summary
          Text(
            "Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),

          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Product Name"),
            subtitle: Text("Qty: 1"),
            trailing: Text("₹499"),
          ),
          Divider(),
          ListTile(
            title: Text("Subtotal"),
            trailing: Text("₹499"),
          ),
          ListTile(
            title: Text("Delivery Charges"),
            trailing: Text("₹50"),
          ),
          ListTile(
            title: Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing:
                Text("₹549", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1AboutYou() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            Text("About You",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _inputField("Full Name", widget.fullNameController)),
                SizedBox(width: 12),
                Expanded(child: _inputField("Phone", widget.phoneController)),
              ],
            ),
            _inputField("Email Address", widget.emailController),
            CheckboxListTile(
              title: Text("Email me with news and offers (optional)",
                  style: TextStyle(fontSize: 13)),
              value: widget.subscribe,
              onChanged: (val) => widget.onSubscribeChanged(val!),
            ),
            Row(
              children: [
                Expanded(
                    child: _inputField("PinCode", widget.pinCodeController)),
                SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: widget.selectedState,
                    items: ['Maharashtra', 'Delhi', 'Karnataka']
                        .map((state) =>
                            DropdownMenuItem(child: Text(state), value: state))
                        .toList(),
                    onChanged: (val) => widget.onStateChanged(val!),
                    decoration: InputDecoration(
                      labelText: "State / County",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            CheckboxListTile(
              title: Text("Create an account?", style: TextStyle(fontSize: 13)),
              value: widget.createAccount,
              onChanged: (val) => widget.onCreateAccountChanged(val!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2ShippingAddress() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            Text("Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            _inputField("Delivery city", deliveryCityController),
            _inputField("Type your Address", addressController),
            const SizedBox(height: 8),
            Text("Save As", style: TextStyle(fontWeight: FontWeight.w500)),
            Row(
              children: ["Home", "Office", "Others"].map((type) {
                return Row(
                  children: [
                    Radio<String>(
                      value: type,
                      groupValue: deliveryType,
                      onChanged: (value) {
                        deliveryType = value!;
                      },
                    ),
                    Text(type),
                    const SizedBox(width: 12),
                  ],
                );
              }).toList(),
            ),
            _inputField("Delivery Phone Number", phoneNumberController),
          ],
        ),
      ),
    );
  }

  Widget _buildStep3DeliveryDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            Text("Delivery Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedOccasion,
                    items: deliveryOccasions
                        .map((item) =>
                            DropdownMenuItem(child: Text(item), value: item))
                        .toList(),
                    onChanged: (value) => selectedOccasion = value!,
                    decoration: InputDecoration(
                        labelText: "Delivery Occasion",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: _inputField("Sender's Name", senderNameController)),
              ],
            ),
            _inputField("Message on the Card", cardMessageController,
                maxLines: 3),
            _inputField("Cooking Instructions", cookingInstructionsController,
                maxLines: 3),
            Row(
              children: [
                Expanded(
                    child:
                        _inputField("Delivery Date", deliveryDateController)),
                SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedSlot,
                    items: deliverySlots
                        .map((slot) =>
                            DropdownMenuItem(child: Text(slot), value: slot))
                        .toList(),
                    onChanged: (value) => selectedSlot = value!,
                    decoration: InputDecoration(
                        labelText: "Delivery Slots",
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) =>
            value == null || value.isEmpty ? "Required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class FooterNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Treat your loved ones to something special!",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            children: [
              Icon(Icons.local_shipping, size: 18),
              Text("Fast Delivery", style: TextStyle(fontSize: 11)),
              Icon(Icons.security, size: 18),
              Text("Secure Payment", style: TextStyle(fontSize: 11)),
              Icon(Icons.thumb_up, size: 18),
              Text("Trusted Service", style: TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
