import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/api_helper.dart';
import '../modal/quote_modal.dart';

class QuotesProvider extends ChangeNotifier {
  QuotesApiHelper quotesApiHelper = QuotesApiHelper();
  QuotesModal? quotesModal;
  List<String> quoteSharedList = [];
  List likeList = [];
  List<bool> isLike = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  Future<QuotesModal?> fetchApiData() async {
    final json = await quotesApiHelper.fetchApi();
    quotesModal = QuotesModal.fromJson(json);
    return quotesModal;
  }

  Future<void> saveLikedQuotes(int index, String content, String author) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(isLike[index]){
      quoteSharedList.removeAt(index);
      isLike[index] = false;
      notifyListeners();
    }
    else{
      likeList.add(quotesModal!.results[index]);
      isLike[index] = true;
      String quote = '$content $author';
      quoteSharedList.add(quote);
      sharedPreferences.setStringList('like', quoteSharedList);
      notifyListeners();
    }
  }

  Future<void> getSharedPreferencesLike() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getStringList('like');
  }

  void removeSharedPreferences(int index){
    quoteSharedList.removeAt(index);
    isLike[index] = false;
    notifyListeners();
  }

  QuotesProvider(){
    getSharedPreferencesLike();
  }
}
