import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstance{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String appKey= "247a18e38e58225afffc980e1d8998e1";
}

// https://api.themoviedb.org/3/movie/now_playing?api_key=247a18e38e58225afffc980e1d8998e1
void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
