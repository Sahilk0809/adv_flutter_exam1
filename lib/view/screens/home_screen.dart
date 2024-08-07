import 'package:adv_flutter_exam1/provider/quotes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var quoteProviderTrue = Provider.of<QuotesProvider>(context, listen: true);
    var quoteProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: quoteProviderFalse.fetchApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(quoteProviderTrue.quoteSharedList);
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/133/481/HD-wallpaper-love-black-dark-emotion-loveurhunny-neat-red.jpg'),
                ),
              ),
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: quoteProviderTrue.quotesModal!.results.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quoteProviderTrue.quotesModal!.results[index].content,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '-${quoteProviderTrue.quotesModal!.results[index].author}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          quoteProviderFalse.saveLikedQuotes(
                              index,
                              quoteProviderTrue
                                  .quotesModal!.results[index].content,
                              quoteProviderTrue
                                  .quotesModal!.results[index].author);
                          Navigator.of(context).pushNamed('/like');
                        },
                        child: Icon(
                          (quoteProviderTrue.isLike[index])
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: (quoteProviderTrue.isLike[index])
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                leading: Text('${index + 1}'),
                title: const Text(
                    'Hell, there are no rules here-- we\'re trying to accomplish something.'),
                subtitle: const Text('Thomas Edison'),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
