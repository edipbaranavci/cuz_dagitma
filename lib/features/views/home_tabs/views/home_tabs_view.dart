import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/home_tabs_cubit.dart';
import 'distribution/view/distribution_view.dart';
import 'persons/view/persons_view.dart';
import 'raffle/view/raffle_view.dart';

class HomeTabsView extends StatefulWidget {
  const HomeTabsView({Key? key}) : super(key: key);

  @override
  State<HomeTabsView> createState() => _HomeTabsViewState();
}

class _HomeTabsViewState extends State<HomeTabsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabsCubit>(
      create: (context) => HomeTabsCubit(
        TabController(length: 3, vsync: this),
      ),
      child: const _HomeTabsView(),
    );
  }
}

class _HomeTabsView extends StatelessWidget {
  const _HomeTabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeTabsCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildTabBar(cubit, context),
            buildTabBarView(cubit),
          ],
        ),
      ),
    );
  }

  Expanded buildTabBarView(HomeTabsCubit cubit) {
    return Expanded(
      child: TabBarView(
        controller: cubit.tabController,
        children: const [
          PersonsView(),
          DistributionView(),
          RaffleView(),
        ],
      ),
    );
  }

  TabBar buildTabBar(HomeTabsCubit cubit, BuildContext context) {
    return TabBar(
      controller: cubit.tabController,
      labelStyle: context.textTheme.titleMedium,
      padding: EdgeInsets.zero,
      splashBorderRadius: context.lowBorderRadius,
      tabs: const [
        Tab(text: 'Kişiler'),
        Tab(text: 'Cüz Dağıtımı'),
        Tab(text: 'Hatim Kurası'),
      ],
    );
  }
}
