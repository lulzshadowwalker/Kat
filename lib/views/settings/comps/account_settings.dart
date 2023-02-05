// ignore_for_file: use_build_context_synchronously

part of './settings_comps.dart';

class _AccountSettings extends HookConsumerWidget {
  _AccountSettings();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;
    final selectedImage = useState<Uint8List?>(null);
    final emailCon = useTextEditingController();
    final hasChangedEmail = useState<bool>(false);

    useEffect(() {
      emailCon.addListener(() {
        emailCon.text.isNotEmpty
            ? hasChangedEmail.value = true
            : hasChangedEmail.value = false;
      });

      return null;
    });

    return Scaffold(
      appBar: KatAppBar(
        title: KatTranslations.account.tr(),
      ),
      body: KatUnfocusableWrapper(
        child: KatSingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                ImagePickerCircleAvatar(
                  initialImage: user!.pfp.asCachedNetImg,
                  onSelected: (image) => selectedImage.value = image,
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: KatEmailField(
                    controller: emailCon,
                    hintText: user.email,
                  ),
                ),
                Visibility(
                  visible: hasChangedEmail.value,
                  child: KatPasswordField(
                    hintText: KatTranslations.passwordToContinue.tr(),
                  ),
                ),
                Visibility(
                  visible: hasChangedEmail.value || selectedImage.value != null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: KatExpandedElevatedButton(
                      onPressed: () async {
                        if (hasChangedEmail.value &&
                            (_formKey.currentState == null ||
                                !_formKey.currentState!.validate())) return;

                        final cred = ref.read(credProvider);

                        if (hasChangedEmail.value) {
                          await AuthController.emailSignIn(context, ref);
                        }

                        await RemoteDbController.updateAccountDetails(
                          context: context,
                          email: cred.email,
                          pfp: selectedImage.value,
                        );

                        KatHelpers.pop(context);
                      },
                      text: KatTranslations.update.tr(),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Bounceable(
                  onTap: () => AuthController.sendPasswordResetEmail(context),
                  child: _SettingsOption(
                    margin: const EdgeInsets.only(bottom: 16),
                    title: const Text(KatTranslations.resetPassword).tr(),
                    trailing: const FaIcon(
                      FontAwesomeIcons.solidCircleQuestion,
                    ),
                    isWrapped: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
