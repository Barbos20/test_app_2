import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class CalendarScreen extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarScreen({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDate;
  final ScrollController _scrollController = ScrollController();
  late List<String> _monthNames;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _monthNames = [
      Localized.of(context).january,
      Localized.of(context).february,
      Localized.of(context).march,
      Localized.of(context).april,
      Localized.of(context).may,
      Localized.of(context).june,
      Localized.of(context).july,
      Localized.of(context).august,
      Localized.of(context).september,
      Localized.of(context).october,
      Localized.of(context).november,
      Localized.of(context).december,
    ];
  }

  String _getDateText(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return "Cегодня";
    } else {
      return "${_formatDay(date.day)} ${_monthNames[date.month - 1]} ${date.year}";
    }
  }

  String _formatDay(int day) {
    return day.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final currentMonth = currentDate.month;
    final currentYear = currentDate.year;

    final months = <DateTime>[];
    for (int year = 2023; year <= currentYear; year++) {
      for (int month = 1; month <= 12; month++) {
        if (year == currentYear && month > currentMonth) break;
        months.add(DateTime(year, month, 1));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 64,
            right: 20,
          ),
          child: Column(
            children: [
              appBar(),
              const Gap(26),
              _buildDaysOfWeek(),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: months.map((month) {
                      return Column(
                        children: [
                          _buildHeader(month),
                          const Gap(17),
                          _buildDates(month),
                          const Gap(28),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            Assets.icons.cross,
            width: 16,
            height: 16,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Text(
          _getDateText(_selectedDate),
          style: AppTextStyle.style18w600.copyWith(
            color: AppColors.grey2,
          ),
        )
      ],
    );
  }

  Widget _buildHeader(DateTime month) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month.year.toString(),
            style: AppTextStyle.style16w700.copyWith(
              color: AppColors.grey2,
            ),
          ),
          Text(
            _monthNames[month.month - 1],
            style: AppTextStyle.style24w700.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeek() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(7, (index) {
        return Text(
          ["ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ", "ВС"][index],
          style: AppTextStyle.style12w600.copyWith(
            color: AppColors.grey2,
          ),
        );
      }),
    );
  }

  Widget _buildDates(DateTime month) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final startWeekday = firstDayOfMonth.weekday % 7;

    const totalCells = 35;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8.0,
      ),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        final absoluteDayIndex = index + 1;
        int day = absoluteDayIndex - startWeekday;

        if (day <= 0 || day > daysInMonth) {
          return Container();
        }

        final currentDate = DateTime(month.year, month.month, day);

        bool isToday = currentDate.year == DateTime.now().year &&
            currentDate.month == DateTime.now().month &&
            currentDate.day == DateTime.now().day;

        bool isSelected = _selectedDate.year == currentDate.year &&
            _selectedDate.month == currentDate.month &&
            _selectedDate.day == currentDate.day;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = currentDate;
            });
            widget.onDateSelected(currentDate);
          },
          child: Container(
            width: 41,
            height: 41,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? Colors.orange.withOpacity(0.25)
                  : Colors.transparent,
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    day.toString(),
                    style: AppTextStyle.style18w500.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
                if (isToday)
                  Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mandarin,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
