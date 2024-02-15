class UrunModel {
  final String uid;
  final String baslik;
  final String resimAdresi;
  final double usdFiyat;
  final double indirimOrani;
  final double puan;
  final int degerlendirmeSayisi;
  final bool topSellerVarMi;
  final bool favorideMi;

  const UrunModel({
    required this.uid,
    required this.baslik,
    required this.resimAdresi,
    required this.usdFiyat,
    required this.indirimOrani,
    required this.puan,
    required this.degerlendirmeSayisi,
    required this.topSellerVarMi,
    required this.favorideMi,
  });

  factory UrunModel.fromFirestore(Map map, String uid) {
    return UrunModel(
      uid: uid,
      baslik: map['title'],
      resimAdresi: map['imageUrl'],
      usdFiyat: map['priceUSD'],
      indirimOrani: map['discountRatio'],
      puan: map['score'],
      degerlendirmeSayisi: map['evaluationNumber'],
      topSellerVarMi: map['isTopSeller'],
      favorideMi: map['isFavorite'],
    );
  }
}
