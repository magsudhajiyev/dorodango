import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../hunt/widgets/dorodango_ball.dart';
import '../providers/auth_provider.dart';

/// Email login / registration, with guest access as an explicit option.
/// On success the auth stream flips and the router redirects to /home.
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegister = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) return;
    final controller = ref.read(authControllerProvider.notifier);
    if (_isRegister) {
      await controller.registerWithEmail(email, password);
    } else {
      await controller.signInWithEmail(email, password);
    }
  }

  String _errorText(AppLocalizations l10n, AuthError error) =>
      switch (error) {
        AuthError.invalidCredentials => l10n.authErrorInvalidCredentials,
        AuthError.emailInUse => l10n.authErrorEmailInUse,
        AuthError.weakPassword => l10n.authErrorWeakPassword,
        AuthError.generic => l10n.authErrorGeneric,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final form = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: const DorodangoBall(size: 64))
                  .animate()
                  .fadeIn(duration: 350.ms),
              const SizedBox(height: AppSpacing.md),
              Text(
                _isRegister ? l10n.registerTitle : l10n.signInTitle,
                style: AppTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: l10n.emailHint),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: l10n.passwordHint),
                obscureText: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
              ),

              if (form.error != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  _errorText(l10n, form.error!),
                  style:
                      AppTypography.caption.copyWith(color: AppColors.error),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: AppSpacing.lg),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: form.loading ? null : _submit,
                  child: form.loading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          _isRegister ? l10n.registerTitle : l10n.signInTitle),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              TextButton(
                onPressed: form.loading
                    ? null
                    : () => setState(() => _isRegister = !_isRegister),
                child: Text(_isRegister
                    ? l10n.authToggleToLogin
                    : l10n.authToggleToRegister),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
