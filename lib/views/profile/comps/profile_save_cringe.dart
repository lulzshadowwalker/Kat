part of './profile_comps.dart';

class _ProfileSaveCringe extends StatelessWidget {
  const _ProfileSaveCringe();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ProfileAnim(),
          Text(
            KatTranslations.startBySavingSomeCringe.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
