import 'package:flutter/material.dart';

import './ui/home.dart';
import './ui/example.dart';
import './ui/card.dart';
import './ui/wisdom.dart';
import './ui/tip_calculator.dart';
import './ui/quiz.dart';
import './ui/movie.dart';

// void main() => runApp(Home());
void main() => runApp(new MaterialApp(
      home: MovieListView(),
));
