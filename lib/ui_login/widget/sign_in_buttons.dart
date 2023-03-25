import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButtons extends HookWidget {
  const SignInButtons({required this.onSignIn, super.key});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: Responsive().setWidth(12)),
          child: GestureDetector(
            onTap: () => isSelected.value = !isSelected.value,
            child: Row(
              children: <Widget>[
                Container(
                  width: 16,
                  height: 16,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2),
                  ),
                  child: Offstage(
                    offstage: !isSelected.value,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive().setWidth(8),
                  ),
                  child: Text(
                    'Remember me',
                    style: GoogleFonts.mulish(
                      fontSize: Responsive().setSp(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
              colors: <Color>[Color(0xFF17EAD9), Color(0xFF6078EA)],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFF6078EA).withOpacity(.3),
                offset: const Offset(0, 8),
                blurRadius: 8,
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent,
              disabledBackgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size(
                Responsive().setWidth(200),
                Responsive().setHeight(60),
              ),
            ),
            onPressed: onSignIn,
            child: Text(
              'Sign In',
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: Responsive().setSp(18),
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
