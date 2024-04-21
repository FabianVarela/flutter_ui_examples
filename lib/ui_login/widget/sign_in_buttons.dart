part of '../login_ui.dart';

class _SignInButtons extends HookWidget {
  const _SignInButtons({required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Remember me',
                    style: GoogleFonts.mulish(fontSize: 12),
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
              minimumSize: const Size(200, 60),
            ),
            onPressed: onSignIn,
            child: Text(
              'Sign In',
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
