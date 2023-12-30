import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_ui_examples/common/hooks/tween_animation_hook.dart';
import 'package:flutter_ui_examples/ui_on_boarding/model/page_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

part 'widget/on_boarding_item.dart';

part 'widget/page_indicator.dart';

class OnBoardingUI extends StatefulHookWidget {
  const OnBoardingUI({super.key});

  @override
  _OnBoardingUIState createState() => _OnBoardingUIState();
}

class _OnBoardingUIState extends State<OnBoardingUI> {
  @override
  Widget build(BuildContext context) {
    final currentPage = useState(0);
    final isLastPage = useState(false);
    final pageController = usePageController();

    final animController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final animation = useTweenAnimation(animController, begin: .6, end: 1)
        .animate(animController);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF485563), Color(0xFF29323C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: <double>[0, 1],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              PageView.builder(
                itemCount: pageList.length,
                controller: pageController,
                onPageChanged: (index) {
                  currentPage.value = index;

                  if (currentPage.value == pageList.length - 1) {
                    isLastPage.value = true;
                    animController.forward();
                  } else {
                    animController.reverse();
                    Future.delayed(const Duration(milliseconds: 300), () {
                      isLastPage.value = false;
                    });
                  }
                },
                itemBuilder: (_, index) => OnboardingItem(
                  pageModel: pageList[index],
                  pageController: pageController,
                  index: index,
                ),
              ),
              Positioned(
                left: 30,
                bottom: 30,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: PageIndicator(
                    pageCount: pageList.length,
                    currentPage: currentPage.value,
                  ),
                ),
              ),
              if (isLastPage.value)
                Positioned(
                  right: 30,
                  bottom: 30,
                  child: ScaleTransition(
                    scale: animation,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
