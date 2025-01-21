class AuthPageState {
  final bool isLoading;
  final bool isShowLoginBtn;
  final bool isShowPass;

  const AuthPageState({
    this.isLoading = false,
    this.isShowLoginBtn = false,
    this.isShowPass = true,
  });
}