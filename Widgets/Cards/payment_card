import 'package:brand/Models/user_data.dart';
import 'package:brand/Widgets/main_button.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_expiration_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_cvc_input_formatter.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:brand/Controllers/payment.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  final UserData user;
  final Function refresh;

  const AddPaymentMethodScreen({
    Key? key,
    required this.refresh,
    required this.user,
  }) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _countryPicker = const FlCountryCodePicker(showDialCode: false);
  final TextEditingController _nameController = TextEditingController();
  final List<String> _paymentTypes = ["Debit/Credit Card"];
  final CreditCardValidator _ccValidator = CreditCardValidator();
  final int _selectedPaymentType = 0;

  CardDetails _card = CardDetails();
  String _cardType = "";
  String? _issuedCountry;
  bool _isDefault = false;
  bool _isLoading = false;

  String _getCardImagePath() {
    if (_cardType == "visa") {
      return "assets/images/supportedCardCompanies/visa.png";
    } else if (_cardType == "mastercard") {
      return "assets/images/supportedCardCompanies/mastercard.png";
    } else if (_cardType == "american_express") {
      return "assets/images/supportedCardCompanies/amex.png";
    } else if (_cardType == "discover") {
      return "assets/images/supportedCardCompanies/discover.png";
    } else {
      return "";
    }
  }

  void _showSelectCountryPopup() async {
    final code = await _countryPicker.showPicker(context: context);

    setState(() {
      _issuedCountry = code?.name;
    });
  }

  bool _isCardValid() {
    if (_nameController.text.isNotEmpty &&
        _card.number != null &&
        _card.expirationMonth != null &&
        _card.expirationYear != null &&
        _card.cvc != null &&
        _issuedCountry != null &&
        _ccValidator.validateCCNum(_card.number!).isValid &&
        _ccValidator
            .validateExpDate('${_card.expirationMonth}/${_card.expirationYear}')
            .isValid &&
        _ccValidator
            .validateCVV(
                _card.cvc!, _ccValidator.validateCCNum(_card.number!).ccType)
            .isValid) {
      return true;
    }
    return false;
  }

  void _savePaymentDetails() async {
    setState(() {
      _isLoading = true;
    });

    await payment.savePaymentDetails(
      _card,
      _isDefault,
      widget.user,
    );

    setState(() {
      _isLoading = false;
    });

    if (context.mounted) {
      Navigator.pop(context);
    }
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          // top: 30,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FeatherIcons.x,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'Add a Payment Method',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans-VariableFont_wght',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(
                  _paymentTypes.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: _selectedPaymentType == index
                              ? Colors.black
                              : Colors.grey,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   _selectedPaymentMethod = index;
                          // });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _selectedPaymentType == index
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            bottom: 2.0,
                          ),
                          child: Text(
                            _paymentTypes[index],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'Name on Card',
                style: TextStyle(
                  fontFamily: 'Inter-VariableFont_slntwght',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: _nameController,
                  onChanged: (val) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'Card Number',
                style: TextStyle(
                  fontFamily: 'Inter-VariableFont_slntwght',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 12,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() {
                      _cardType = _ccValidator.validateCCNum(val).ccType.type;
                      _card = _card.copyWith(number: val);
                    });
                  },
                  inputFormatters: [
                    CreditCardNumberInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 1,
                      minWidth: 1,
                    ),
                    suffixIcon: _getCardImagePath() == ""
                        ? null
                        : SizedBox(
                            height: 13,
                            child: Image.asset(
                              _getCardImagePath(),
                            ),
                          ),
                  ),
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontFamily: 'Inter-VariableFont_slntwght',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Exp. Date',
                          style: TextStyle(
                            fontFamily: 'Inter-VariableFont_slntwght',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              if (val.length == 5 && val.contains('/')) {
                                setState(() {
                                  _card = _card.copyWith(
                                      expirationMonth:
                                          int.parse(val.substring(0, 2)),
                                      expirationYear:
                                          int.parse(val.substring(3)));
                                });
                              }
                            },
                            inputFormatters: [
                              CreditCardExpirationDateFormatter(),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontFamily: 'Inter-VariableFont_slntwght',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVC',
                          style: TextStyle(
                            fontFamily: 'Inter-VariableFont_slntwght',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              setState(() {
                                _card = _card.copyWith(cvc: val);
                              });
                            },
                            inputFormatters: [
                              CreditCardCvcInputFormatter(
                                isAmericanExpress:
                                    _cardType == "american_express",
                              ),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontFamily: 'Inter-VariableFont_slntwght',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0,
              ),
              child: Text(
                'Issued Country',
                style: TextStyle(
                  fontFamily: 'Inter-VariableFont_slntwght',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  onPressed: _showSelectCountryPopup,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _issuedCountry == null
                            ? 'Select Country'
                            : _issuedCountry!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Set as Default Payment Method',
                    style: TextStyle(
                      fontFamily: 'Inter-VariableFont_slntwght',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Checkbox(
                    value: _isDefault,
                    onChanged: (value) {
                      setState(() {
                        _isDefault = value!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            mainButton(
              onTap: _savePaymentDetails,
              text: 'CONTINUE',
              isValid: _isCardValid,
              isProcessing: _isLoading,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
