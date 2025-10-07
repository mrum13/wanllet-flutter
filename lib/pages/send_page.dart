import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/common/image_resources.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final TextEditingController _valueController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _formatter = NumberFormat("#,###", "id_ID");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _valueController.addListener(_formatCurrency);
  }

  @override
  void dispose() {
    _valueController.removeListener(_formatCurrency);
    _valueController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _formatCurrency() {
    final text = _valueController.text.replaceAll('.', '');
    if (text.isEmpty) return;
    final number = int.tryParse(text);
    if (number == null) return;

    final newText = _formatter.format(number);
    if (newText != _valueController.text) {
      final cursorPos = newText.length;
      _valueController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPos),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              background3,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SafeArea(
              // bottom: false,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 24,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Send Money",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 16, top: 24, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(cardBackground),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(avatar3, height: 50, width: 50),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ihsan Mustapa",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor,
                                ),
                              ),
                              Text(
                                "+6285397875412".toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            size: 24,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 63),
                  Text(
                    "Send Amount",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                  Center(
                    child: TextField(
                      controller: _valueController,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // prefixText: "Rp.",
                        // prefixStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.w600, color: whiteColor)
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 54),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        "Send Money Now !",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
