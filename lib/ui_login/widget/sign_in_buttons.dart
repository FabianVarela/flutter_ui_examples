part of '../login_ui.dart';

class _SignInButtons extends HookWidget {
  const _SignInButtons({required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: <Widget>[
        const Gap(0),
        GestureDetector(
          onTap: () => isSelected.value = !isSelected.value,
          child: Row(
            children: <Widget>[
              SizedBox.fromSize(
                size: const .square(16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: .circle,
                    border: .all(width: 2),
                  ),
                  child: Offstage(
                    offstage: !isSelected.value,
                    child: Container(
                      width: .infinity,
                      height: .infinity,
                      margin: const .all(4),
                      decoration: const BoxDecoration(
                        shape: .circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Text('Remember me', style: GoogleFonts.mulish(fontSize: 12)),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            overlayColor: Colors.black,
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white60,
            minimumSize: const Size(200, 60),
            shape: RoundedRectangleBorder(borderRadius: .circular(6)),
            backgroundBuilder: (_, state, child) {
              var opacity = 1.0;
              if (state.contains(WidgetState.disabled)) opacity = .6;

              return Ink(
                decoration: BoxDecoration(
                  borderRadius: .circular(6),
                  gradient: LinearGradient(
                    colors: <Color>[
                      const Color(0xFF17EAD9).withValues(alpha: opacity),
                      const Color(0xFF6078EA).withValues(alpha: opacity),
                    ],
                  ),
                ),
                child: child,
              );
            },
          ),
          onPressed: onSignIn,
          child: Text(
            'Sign In',
            style: GoogleFonts.mulish(fontSize: 18, letterSpacing: 1),
          ),
        ),
      ],
    );
  }
}
