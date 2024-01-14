
import 'package:lexam/lexam.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              'পরীক্ষার পরিসংখ্যান ',
              style: AppTextStyles.widgetTitle,
            ),
            Text(
              '(সর্বশেষ ৩০ দিনের)',
              style: AppTextStyles.body,
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            chartWidget(),
            legendsWidget(),
          ],
        )
      ],
    );
  }

  Widget chartWidget() {
    return Expanded(
      child: SizedBox(
        width: 140.h,
        height: 140.h,
        child: PieChart(
          dataMap: const {
            'সঠিক': 27,
            'ভুল': 40,
            'অনুত্তরিত': 10,
          },
          colorList: [
            AppColors.green,
            AppColors.red,
            AppColors.custom('#96C3E7'),
          ],
          chartType: ChartType.ring,
          ringStrokeWidth: 15.h,
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
            showChartValuesOutside: false
          ),
          baseChartColor: AppColors.lightBlueAccent,
          legendOptions: const LegendOptions(showLegends: false),
        ),
      ),
    );
  }

  Widget legendsWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'মোট : ৪৫',
            style: AppTextStyles.body.copyWith(
              color: AppColors.blue,
            ),
          ),
          Text(
            'উত্তীর্ণ : ৩৫',
            style: AppTextStyles.title.copyWith(
              color: AppColors.yellow,
            ),
          ),
          SizedBox(height: 20.h),
          optionWidget(
            value: 'সঠিক ২৭%',
            color: AppColors.green,
          ),
          optionWidget(
            value: 'ভুল ৪০%',
            color: AppColors.red,
          ),
          optionWidget(
            value: 'অনুত্তরিত ১০%',
            color: AppColors.custom('#96C3E7'),
          ),
        ],
      ),
    );
  }

  Widget optionWidget({required String value, required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: AppColors.black,
            ),
          ),
          SizedBox(width: 4.w),
          Container(
            width: 14.h,
            height: 14.h,
            color: color,
          ),
        ],
      ),
    );
  }
}
