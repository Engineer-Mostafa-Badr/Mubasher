import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/views/components/custom_details_profile.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 2.h),
            CustomDetailsProfile(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PageRouteName.productRoute,
                );
              },
              text: context.lang.paymentText,
              isPaymentView: true,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF9F2),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AssetsManager.paymentView,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'Mill Sper House',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                textColor: Color(0xFFB88917),
                              ),

                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  AppText(
                                    text: '4.8',
                                    fontSize: 12,
                                    textColor: Colors.black54,
                                  ),

                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.black38,
                                  ),
                                  const SizedBox(width: 2),
                                  AppText(
                                    text: 'Jaddah',
                                    fontSize: 12,
                                    textColor: Colors.black54,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D4D59),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: AppText(
                            text: '\$ 271/month',
                            fontSize: 12,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: AppText(
                text: context.lang.paymentDataText,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textColor: Color(0xFFB88917),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const PaymentInputField(label: "Phone number", value: ''),
                  const SizedBox(height: 14),
                  const PaymentInputField(label: "Phone number", value: ''),
                  const SizedBox(height: 14),
                  const PaymentInputField(label: "Whatsapp", value: ''),
                  const SizedBox(height: 14),
                  const PaymentInputField(label: "E mail", value: ''),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            ElevatedButtonManager(
              text: context.lang.payNowText,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInputField extends StatelessWidget {
  final String label;
  final String value;

  const PaymentInputField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          fontSize: 14.px,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
          textColor: ColorManager.primaryColor,
        ),
        SizedBox(height: 0.2.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6E9),
            borderRadius: BorderRadius.circular(15.w),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
