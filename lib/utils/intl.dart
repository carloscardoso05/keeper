import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> setupIntl() async {
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting(Intl.defaultLocale, null);
}
