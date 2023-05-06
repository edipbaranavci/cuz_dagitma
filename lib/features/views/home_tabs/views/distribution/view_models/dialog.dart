part of '../view/distribution_view.dart';

class _Dialog extends StatelessWidget {
  const _Dialog();
  final String copyButtonTitle = 'Kopyala';
  final String cancelButtonTitle = 'İptal';
  final String title = 'Dağıtılan Cüzler';

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: title,
        child: SizedBox(
          height: context.height * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocBuilder<DistributionCubit, DistributionState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Text(
                        state.copyText ?? '',
                        style: context.textTheme.headlineSmall,
                      ),
                    );
                  },
                ),
              ),
              buildBottomButtons(context),
            ],
          ),
        ));
  }

  Row buildBottomButtons(BuildContext context) {
    final cubit = context.read<DistributionCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomElevatedTextButton(
            onPressed: () =>
                cubit.copyTextCopy().whenComplete(() => context.pop()),
            title: copyButtonTitle,
          ),
        ),
        context.emptySizedWidthBoxLow3x,
        Expanded(
          child: CustomElevatedTextButton(
            onPressed: () => context.pop(),
            title: cancelButtonTitle,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
