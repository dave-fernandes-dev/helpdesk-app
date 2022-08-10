import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool isLogged(String? token) {
  if (token == null || token.isEmpty) {
    return false;
  } else {
    return true;
  }
}

String handlerStatus(String? status) {
  switch (status) {
    case "0":
      {
        return "EM ABERTO";
      }
    case "1":
      {
        return "EM ANDAMENTO";
      }
    case "2":
      {
        return "ENCERRADO";
      }
    default:
      {
        return "ND";
      }
  }
}

String handlerPrioridade(String? prioridade) {
  switch (prioridade) {
    case "0":
      {
        return "BAIXA";
      }
    case "1":
      {
        return "MÉDIA";
      }
    case "2":
      {
        return "ALTA";
      }
    default:
      {
        return "ND";
      }
  }
}
