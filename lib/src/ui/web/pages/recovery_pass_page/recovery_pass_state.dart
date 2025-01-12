class RecoveryPassState {
  final int count;
  final bool isLoading;
  final bool isShowEmailBtn;
  final bool isRecovery;
  final bool isChecked;
  final bool isNewPassword;
  final bool enabledVerifyBtn;
  final bool enabledConfirmPassBtn;
  final bool isShowNewPass;
  final bool isShowConfirmPass;
  final String userEmail;

  const RecoveryPassState({
    this.count = 0,
    this.isLoading = false,
    this.isShowEmailBtn = false,
    this.isRecovery = false,
    this.isChecked = false,
    this.isNewPassword = false,
    this.enabledVerifyBtn = false,
    this.enabledConfirmPassBtn = false,
    this.isShowNewPass = true,
    this.isShowConfirmPass = true,
    this.userEmail = '',
  });
}
