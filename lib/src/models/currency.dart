import 'package:decimal/decimal.dart';
import 'package:mtg_cards/databases.dart';

class Price extends Comparable {
  final Decimal price;

  Price({required this.price});

  static Price get zero => Price(price: Decimal.zero);

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      price: Decimal.parse((json['price'] as Map<String, dynamic>)['\$numberDecimal'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': {'\$numberDecimal': price.toString()},
    };
  }

  Price copyWith({
    Decimal? price,
  }) {
    return Price(
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'Price(price: $price)';
  }

  @override
  int compareTo(other) {
    if (other is Price) {
      return price.compareTo(other.price);
    } else {
      return 0;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Price && other.price == price;
  }

  @override
  int get hashCode {
    return price.hashCode;
  }

  Future<Decimal> priceIn(String currency, {int quantity = 1}) async {
    if (currency.toLowerCase() == 'usd') {
      return price * Decimal.fromInt(quantity);
    } else {
      CurrencyEntry currencyEntry = await currencyDatabase.getCurrency(currency);
      if (currencyEntry.exchangeRate > 1) {
        return Decimal.parse((price.toDouble() / currencyEntry.exchangeRate).toString()) * Decimal.fromInt(quantity);
      } else {
        return price * Decimal.parse(currencyEntry.exchangeRate.toString()) * Decimal.fromInt(quantity);
      }
    }
  }

  Future<String> formattedPriceIn(String currency, {int quantity = 1}) async {
    Decimal amount = await priceIn(currency, quantity: quantity);
    switch (currency.toLowerCase()) {
      case 'aed':
        return 'د.إ ${amount.toStringAsFixed(2)}';
      case 'afn':
        return '؋ ${amount.toStringAsFixed(2)}';
      case 'all':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'amd':
        return '֏ ${amount.toStringAsFixed(2)}';
      case 'ang':
        return 'ƒ ${amount.toStringAsFixed(2)}';
      case 'aoa':
        return 'Kz ${amount.toStringAsFixed(2)}';
      case 'ars':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'aud':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'awg':
        return 'ƒ ${amount.toStringAsFixed(2)}';
      case 'azn':
        return '₼ ${amount.toStringAsFixed(2)}';
      case 'bam':
        return 'KM ${amount.toStringAsFixed(2)}';
      case 'bbd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bdt':
        return '৳ ${amount.toStringAsFixed(2)}';
      case 'bgn':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'bhd':
        return '.د.ب ${amount.toStringAsFixed(2)}';
      case 'bif':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'bmd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bnd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'bob':
        return '\$b ${amount.toStringAsFixed(2)}';
      case 'brl':
        return 'R\$ ${amount.toStringAsFixed(2)}';
      case 'bsd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'btc':
        return '₿ ${amount.toStringAsFixed(6)}';
      case 'btn':
        return 'Nu. ${amount.toStringAsFixed(2)}';
      case 'bwp':
        return 'P ${amount.toStringAsFixed(2)}';
      case 'byn':
        return 'Br ${amount.toStringAsFixed(2)}';
      case 'bzd':
        return 'BZ\$ ${amount.toStringAsFixed(2)}';
      case 'cad':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cdf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'chf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'clf':
        return 'UF ${amount.toStringAsFixed(2)}';
      case 'clp':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cny':
        return '¥ ${amount.toStringAsFixed(2)}';
      case 'cop':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'crc':
        return '₡ ${amount.toStringAsFixed(2)}';
      case 'cuc':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cup':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'cve':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'czk':
        return 'Kč ${amount.toStringAsFixed(2)}';
      case 'djf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'dkk':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'dop':
        return 'RD\$ ${amount.toStringAsFixed(2)}';
      case 'dzd':
        return 'د.ج ${amount.toStringAsFixed(2)}';
      case 'egp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'ern':
        return 'Nfk ${amount.toStringAsFixed(2)}';
      case 'etb':
        return 'Br ${amount.toStringAsFixed(2)}';
      case 'eur':
        return '€ ${amount.toStringAsFixed(2)}';
      case 'fjd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'fkp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gbp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gel':
        return '₾ ${amount.toStringAsFixed(2)}';
      case 'ggp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'ghs':
        return '₵ ${amount.toStringAsFixed(2)}';
      case 'gip':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'gmd':
        return 'D ${amount.toStringAsFixed(2)}';
      case 'gnf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'gtq':
        return 'Q ${amount.toStringAsFixed(2)}';
      case 'gyd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'hkd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'hnl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'hrk':
        return 'kn ${amount.toStringAsFixed(2)}';
      case 'htg':
        return 'G ${amount.toStringAsFixed(2)}';
      case 'huf':
        return 'Ft ${amount.toStringAsFixed(2)}';
      case 'idr':
        return 'Rp ${amount.toStringAsFixed(2)}';
      case 'ils':
        return '₪ ${amount.toStringAsFixed(2)}';
      case 'imp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'inr':
        return '₹ ${amount.toStringAsFixed(2)}';
      case 'iqd':
        return 'ع.د ${amount.toStringAsFixed(2)}';
      case 'irr':
        return '﷼ ${amount.toStringAsFixed(2)}';
      case 'isk':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'jep':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'jmd':
        return 'J\$ ${amount.toStringAsFixed(2)}';
      case 'jod':
        return 'د.ا ${amount.toStringAsFixed(2)}';
      case 'jpy':
        return '¥ ${amount.toStringAsFixed(2)}';
      case 'kes':
        return 'Sh ${amount.toStringAsFixed(2)}';
      case 'kgs':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'khr':
        return '៛ ${amount.toStringAsFixed(2)}';
      case 'kmf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'kpw':
        return '₩ ${amount.toStringAsFixed(2)}';
      case 'krw':
        return '₩ ${amount.toStringAsFixed(2)}';
      case 'kwd':
        return 'د.ك ${amount.toStringAsFixed(2)}';
      case 'kyd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'kzt':
        return 'лв ${amount.toStringAsFixed(2)}';
      case 'lak':
        return '₭ ${amount.toStringAsFixed(2)}';
      case 'lbp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'lkr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'lrd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'lsl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'lyd':
        return 'ل.د ${amount.toStringAsFixed(2)}';
      case 'mad':
        return 'د.م. ${amount.toStringAsFixed(2)}';
      case 'mdl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'mga':
        return 'Ar ${amount.toStringAsFixed(2)}';
      case 'mkd':
        return 'ден ${amount.toStringAsFixed(2)}';
      case 'mmk':
        return 'Ks ${amount.toStringAsFixed(2)}';
      case 'mnt':
        return '₮ ${amount.toStringAsFixed(2)}';
      case 'mop':
        return 'P ${amount.toStringAsFixed(2)}';
      case 'mro':
        return 'UM ${amount.toStringAsFixed(2)}';
      case 'mur':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'mvr':
        return 'Rf ${amount.toStringAsFixed(2)}';
      case 'mwk':
        return 'MK ${amount.toStringAsFixed(2)}';
      case 'mxn':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'myr':
        return 'RM ${amount.toStringAsFixed(2)}';
      case 'mzn':
        return 'MT ${amount.toStringAsFixed(2)}';
      case 'nad':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'ngn':
        return '₦ ${amount.toStringAsFixed(2)}';
      case 'nio':
        return 'C\$ ${amount.toStringAsFixed(2)}';
      case 'nok':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'npr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'nzd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'omr':
        return 'ر.ع. ${amount.toStringAsFixed(2)}';
      case 'pab':
        return 'B/. ${amount.toStringAsFixed(2)}';
      case 'pen':
        return 'S/. ${amount.toStringAsFixed(2)}';
      case 'pgk':
        return 'K ${amount.toStringAsFixed(2)}';
      case 'php':
        return '₱ ${amount.toStringAsFixed(2)}';
      case 'pkr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'pln':
        return 'zł ${amount.toStringAsFixed(2)}';
      case 'pyg':
        return 'Gs ${amount.toStringAsFixed(2)}';
      case 'qar':
        return 'ر.ق ${amount.toStringAsFixed(2)}';
      case 'ron':
        return 'lei ${amount.toStringAsFixed(2)}';
      case 'rsd':
        return 'Дин. ${amount.toStringAsFixed(2)}';
      case 'rub':
        return '₽ ${amount.toStringAsFixed(2)}';
      case 'rwf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'sar':
        return 'ر.س ${amount.toStringAsFixed(2)}';
      case 'sbd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'scr':
        return '₨ ${amount.toStringAsFixed(2)}';
      case 'sdg':
        return 'ج.س ${amount.toStringAsFixed(2)}';
      case 'sek':
        return 'kr ${amount.toStringAsFixed(2)}';
      case 'sgd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'shp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'sll':
        return 'Le ${amount.toStringAsFixed(2)}';
      case 'sos':
        return 'S ${amount.toStringAsFixed(2)}';
      case 'srd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'std':
        return 'Db ${amount.toStringAsFixed(2)}';
      case 'svc':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'syp':
        return '£ ${amount.toStringAsFixed(2)}';
      case 'szl':
        return 'L ${amount.toStringAsFixed(2)}';
      case 'thb':
        return '฿ ${amount.toStringAsFixed(2)}';
      case 'tjs':
        return 'SM ${amount.toStringAsFixed(2)}';
      case 'tmt':
        return 'm ${amount.toStringAsFixed(2)}';
      case 'tnd':
        return 'د.ت ${amount.toStringAsFixed(2)}';
      case 'top':
        return 'T\$ ${amount.toStringAsFixed(2)}';
      case 'try':
        return '₺ ${amount.toStringAsFixed(2)}';
      case 'ttd':
        return 'TT\$ ${amount.toStringAsFixed(2)}';
      case 'twd':
        return 'NT\$ ${amount.toStringAsFixed(2)}';
      case 'tzs':
        return 'TSh ${amount.toStringAsFixed(2)}';
      case 'uah':
        return '₴ ${amount.toStringAsFixed(2)}';
      case 'ugx':
        return 'USh ${amount.toStringAsFixed(2)}';
      case 'usd':
        return '\$ ${amount.toStringAsFixed(2)}';
      case 'uyu':
        return '\$U ${amount.toStringAsFixed(2)}';
      case 'uzs':
        return 'so\'m ${amount.toStringAsFixed(2)}';
      case 'vef':
        return 'Bs ${amount.toStringAsFixed(2)}';
      case 'vnd':
        return '₫ ${amount.toStringAsFixed(2)}';
      case 'vuv':
        return 'VT ${amount.toStringAsFixed(2)}';
      case 'wst':
        return 'WS\$ ${amount.toStringAsFixed(2)}';
      case 'xaf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xcd':
        return 'EC\$ ${amount.toStringAsFixed(2)}';
      case 'xof':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xpf':
        return 'Fr ${amount.toStringAsFixed(2)}';
      case 'xpt':
        return 'XPT ${amount.toStringAsFixed(2)}';
      case 'yer':
        return '﷼ ${amount.toStringAsFixed(2)}';
      case 'zar':
        return 'R ${amount.toStringAsFixed(2)}';
      case 'zmw':
        return 'ZK ${amount.toStringAsFixed(2)}';
      case 'zwl':
        return 'Z\$ ${amount.toStringAsFixed(2)}';
      default:
        return '${amount.toStringAsFixed(2)} $currency';
    }
  }
}
