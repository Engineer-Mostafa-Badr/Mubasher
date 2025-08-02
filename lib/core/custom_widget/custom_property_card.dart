import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class PropertyCard extends StatelessWidget {
  final bool installment;
  final String? months;

  const PropertyCard({super.key, this.installment = false, this.months});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F7FB),
            borderRadius: BorderRadius.circular(15.px),
          ),
          padding: const EdgeInsets.only(
            bottom: 8,
          ), // padding to prevent overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.1,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.px),
                        topRight: Radius.circular(15.px),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.px),
                          child: Image.asset(
                            AssetsManager.shape,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFFD9B777),
                        radius: 16,
                        child: const Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D4D59),
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        child: const Text(
                          "\$ 220/month",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Wings Tower",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "4.9",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.location_on, size: 14, color: Colors.black38),
                    SizedBox(width: 2),
                    Text(
                      "Reyadah",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  installment ? "Installment" : "Rent",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (months != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: Text(
                    months!,
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ),
              const Spacer(), // helps push elements up and prevent overflow
            ],
          ),
        );
      },
    );
  }
}
