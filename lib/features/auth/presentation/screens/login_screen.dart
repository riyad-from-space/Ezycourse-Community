import 'package:ezycourse_community/app/di/injection.dart';
import 'package:ezycourse_community/app/router/route_path.dart';
import 'package:ezycourse_community/core/services/token_storage_service.dart';
import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/core/widgets/app_button.dart';
import 'package:ezycourse_community/core/widgets/app_text_field.dart';
import 'package:ezycourse_community/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _storageService = serviceLocator<TokenStorageService>();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));
    _animController.forward();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final credentials = await _storageService.getCredentials();
    if (mounted && credentials['rememberMe'] == 'true') {
      setState(() {
        _emailController.text = credentials['email'] ?? '';
        _passwordController.text = credentials['password'] ?? '';
        _rememberMe = true;
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        duration: Duration(seconds: isError ? 3 : 2),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(authViewModelProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

    if (!mounted) return;
    final authState = ref.read(authViewModelProvider);

    if (authState.errorMessage != null) {
      _showSnackBar(authState.errorMessage!, isError: true);
      return;
    }

    if (authState.isAuthenticated && authState.token != null) {
      _showSnackBar('Login successful!');
      await _storageService.saveCredentials(
        _emailController.text.trim(),
        _passwordController.text,
        _rememberMe,
      );
      if (mounted) context.pushReplacementNamed(RoutePathName.community);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primary,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              // Fixed background with header image
              Positioned(
                top: .1 * screenHeight,
                left: 50,
                right: 50,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child:Image.asset(
                    'assets/images/login_header.png',
                    fit: BoxFit.contain,
                  ),
                  
                  // isKeyboardOpen? SizedBox() : Image.asset(
                  //   'assets/images/login_header.png',
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),

              // Slidable sign-in card pinned to bottom
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                // bottom: screenHeight * 0.1,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SingleChildScrollView(
                        child: Container(
                          width: screenWidth,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius:  BorderRadius.only(
                             topLeft: Radius.circular(28),
                             topRight: Radius.circular(28),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Title
                                const Text('Sign In', style: AppTextStyles.heading),
                                const SizedBox(height: 8),
                                Text(
                                  'Welcome back! Please sign in to continue.',
                                  style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.textWhite70,
                                  ),
                                ),
                                const SizedBox(height: 36),

                                // Email field
                                AppTextField(
                                  controller: _emailController,
                                  hintText: 'Email',
                                  prefixIcon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _validateEmail,
                                  textInputAction: TextInputAction.next,
                                ),
                                const SizedBox(height: 16),

                                // Password field
                                AppTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                  prefixIcon: Icons.lock_outline,
                                  obscureText: _obscurePassword,
                                  validator: _validatePassword,
                                  textInputAction: TextInputAction.done,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.inputIcon,
                                      size: 20,
                                    ),
                                    splashRadius: 20,
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Remember me
                                GestureDetector(
                                  onTap: () {
                                    setState(() => _rememberMe = !_rememberMe);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value ?? false;
                                            });
                                          },
                                          activeColor: AppColors.accent,
                                          checkColor: AppColors.textOnAccent,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          side: const BorderSide(
                                            color: AppColors.textWhite70,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Remember Me',
                                        style: AppTextStyles.label,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),

                                // Login button
                                AppButton(
                                  text: 'Login',
                                  onPressed: _handleLogin,
                                  isLoading: authState.isLoading,
                                ),
                               
                               SizedBox(height: isKeyboardOpen?0: screenHeight * 0.2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
