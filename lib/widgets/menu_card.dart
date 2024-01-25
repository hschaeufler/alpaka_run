import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onRetry;

  const MenuCard({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Game end',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Super du hast es echt weit geschafft.\r\nWillst du es nochmal probieren?"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => onRetry(),
                child: const Text('Retry'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
