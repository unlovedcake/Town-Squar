part of '../views/activities_view.dart';

class _DesktopContentViewActivities extends StatelessWidget {
  const _DesktopContentViewActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: LeftSideBar()),
        Expanded(flex: 6, child: BodyContent()),
        Expanded(flex: 2, child: RightSidebar()),
      ],
    );
  }
}
