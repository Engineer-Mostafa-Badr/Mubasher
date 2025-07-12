import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFF7F4F4),
                    radius: 24,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFFA0792F),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Messages",
                    style: TextStyle(
                      color: Color(0xFFA0792F),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "New chat",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA0792F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Earlier",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) => const ChatItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(AssetsManager.ellipse2), // ضع صورتك هنا
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Ahmmed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Want to know how to ...",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const Text("12;00 pm", style: TextStyle(color: Colors.black45)),
      ],
    );
  }
}
