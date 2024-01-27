import 'package:flutter/material.dart';

double getFullheight(BuildContext context,double percentage)
{
   return MediaQuery.of(context).size.height * (percentage / 100);
}
double getFullWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}