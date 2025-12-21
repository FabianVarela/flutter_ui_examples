part of '../login_ui.dart';

class _CardForm extends StatelessWidget {
  const _CardForm();

  @override
  Widget build(BuildContext context) {
    final blurRadiusList = <double>[15, 10];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(8),
        boxShadow: blurRadiusList.map((item) {
          return BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 15),
            blurRadius: item,
          );
        }).toList(),
      ),
      child: Padding(
        padding: const .fromLTRB(16, 16, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Login',
              style: GoogleFonts.mulish(fontSize: 35, letterSpacing: .6),
            ),
            const Gap(20),
            Text('Username', style: GoogleFonts.mulish(fontSize: 20)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Set the username',
                hintStyle: GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
              ),
            ),
            const Gap(20),
            Text('Password', style: GoogleFonts.mulish(fontSize: 20)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Set the password',
                hintStyle: GoogleFonts.mulish(color: Colors.grey, fontSize: 14),
              ),
            ),
            const Gap(40),
            Align(
              alignment: .centerRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Forgot password',
                  style: GoogleFonts.mulish(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
