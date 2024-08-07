import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/quotes_provider.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var quoteProviderTrue = Provider.of<QuotesProvider>(context, listen: true);
    var quoteProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: quoteProviderFalse.fetchApiData(),
        builder: (context, snapshot) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/fd/fb/c2/fdfbc2bcfe93ff10c6f729b0a6750aa0.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                itemCount: quoteProviderTrue.quoteSharedList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    quoteProviderTrue.quoteSharedList[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      quoteProviderFalse.removeSharedPreferences(index);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
