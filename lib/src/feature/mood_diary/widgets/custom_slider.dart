import 'package:flutter/material.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class StressSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final String leftTitle;
  final String rightTitle;

  const StressSlider({
    required this.value,
    required this.onChanged,
    super.key,
    required this.leftTitle,
    required this.rightTitle,
  });

  @override
  State<StressSlider> createState() => _StressSliderState();
}

class _StressSliderState extends State<StressSlider> {
  bool _isMoved = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _isMoved = true;
                  });
                  double localValue =
                      (details.localPosition.dx / constraints.maxWidth)
                          .clamp(0.0, 1.0);
                  widget.onChanged(_getClosestStop(localValue));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomPaint(
                      size: Size(constraints.maxWidth, 18),
                      painter: _SliderPainter(widget.value, _isMoved),
                    ),
                    Positioned(
                      left: (widget.value / 5) * constraints.maxWidth - 10.0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: _isMoved
                                  ? AppColors.mandarin
                                  : AppColors.grey5,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (widget.value == 6.0)
                      Positioned(
                        right: -10.0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColors.mandarin,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.leftTitle,
                    style: AppTextStyle.style11w400.copyWith(
                      color: AppColors.grey6,
                    ),
                  ),
                  Text(
                    widget.rightTitle,
                    style: AppTextStyle.style11w400.copyWith(
                      color: AppColors.grey6,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  double _getClosestStop(double value) {
    final List<double> stops = [0, 1, 2, 3, 4, 5];
    double scaledValue = value * 5;
    return stops.reduce(
        (a, b) => (a - scaledValue).abs() < (b - scaledValue).abs() ? a : b);
  }
}

class _SliderPainter extends CustomPainter {
  final double value;
  final bool isMoved;

  _SliderPainter(this.value, this.isMoved);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGray = Paint()
      ..color = AppColors.grey5
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final paintOrange = Paint()
      ..color = isMoved ? AppColors.mandarin : AppColors.grey5
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final paintLine = Paint()
      ..color = AppColors.grey5
      ..strokeWidth = 2;

    double sliderPosition = (value / 5) * size.width;

    for (int i = 0; i <= 5; i++) {
      double x = i * (size.width / 5);
      canvas.drawLine(Offset(x, -2), Offset(x, -12), paintLine);
    }

    canvas.drawLine(Offset(0, size.height / 2),
        Offset(sliderPosition, size.height / 2), paintOrange);
    canvas.drawLine(Offset(sliderPosition, size.height / 2),
        Offset(size.width, size.height / 2), paintGray);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
