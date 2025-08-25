import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 1200;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 32.0 : (isTablet ? 24.0 : 16.0),
              vertical: 16.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 400 : (isTablet ? 500 : double.infinity),
              ),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    isDesktop ? 40.0 : (isTablet ? 32.0 : 24.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo or App Icon
                      Icon(
                        Icons.lock_outline,
                        size: isDesktop ? 80 : (isTablet ? 70 : 60),
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: isDesktop ? 32 : (isTablet ? 24 : 16)),

                      // Welcome Text
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isDesktop ? 28 : (isTablet ? 26 : 24),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sign in to continue',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                          fontSize: isDesktop ? 18 : (isTablet ? 16 : 14),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isDesktop ? 40 : (isTablet ? 32 : 24)),

                      // Email Field
                      _buildLoginTextField(
                        context,
                        'Email',
                        'Enter your email',
                        Icons.email_outlined,
                        false,
                        TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),

                      // Password Field
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                      ),

                      // Forgot Password
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: isDesktop ? 16 : (isTablet ? 15 : 14),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isDesktop ? 32 : (isTablet ? 24 : 16)),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: isDesktop ? 16 : (isTablet ? 14 : 12),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: isDesktop ? 18 : (isTablet ? 16 : 16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: isDesktop ? 24 : (isTablet ? 20 : 16)),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: isDesktop ? 16 : (isTablet ? 15 : 14),
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(height: isDesktop ? 24 : (isTablet ? 20 : 16)),

                      // Social Login Buttons
                      if (isDesktop || isTablet) ...[
                        Row(
                          children: [
                            Expanded(
                              child: _buildSocialButton(
                                context,
                                'Google',
                                Icons.g_mobiledata,
                                Colors.red,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildSocialButton(
                                context,
                                'Facebook',
                                Icons.facebook,
                                Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        _buildSocialButton(
                          context,
                          'Continue with Google',
                          Icons.g_mobiledata,
                          Colors.red,
                        ),
                        SizedBox(height: 12),
                        _buildSocialButton(
                          context,
                          'Continue with Facebook',
                          Icons.facebook,
                          Colors.blue,
                        ),
                      ],

                      SizedBox(height: isDesktop ? 32 : (isTablet ? 24 : 20)),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: isDesktop ? 16 : (isTablet ? 15 : 14),
                              color: Colors.grey[600],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: isDesktop ? 16 : (isTablet ? 15 : 14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTextField(
    BuildContext context,
    String labelText,
    String hintText,
    IconData prefixIcon,
    bool isPassword,
    TextInputType keyboardType,
  ) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
  ) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey[700],
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey[300]!),
      ),
    );
  }
}
