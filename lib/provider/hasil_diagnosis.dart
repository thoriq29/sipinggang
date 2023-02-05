import 'package:sipinggang/core/constants/diagnosa.dart';

import '../core/app_export.dart';

class GenerateHasilDiagnosis {
  GenerateHasilDiagnosis() {

  }

  Map<String, dynamic> execute(Map<GEJALACODES?, Map<String?, double?>> selectedGejala)  {
    // function untuk mendapatkan data diagnosa berdasarkan gejala dengan weights masing-masing dari gejala yang dipilih
    Map<String, dynamic> diags = {};
    double total = 0;
    double gSebelumnya = 0;
    double gNext = 0;
    List<double?> values = selectedGejala.values.map((value) => value["value"]).toList();
    for(int index = 0; index < rules.length; index++) {
      List<double?> ruleList = rules[index]["rules"];
      for (int i = 0; i < values.length; i++) {
        for(int j = 0; j < ruleList.length; j++) {
          if(values[i] as double > 0 && ruleList[i] as double > 0) {
            if(i == 0) {
              total = values[i] as double;
            }
            gNext = i < values.length -1 ? values[i+1] as double : gSebelumnya;
            total = cf(total, gNext);
            print(total);
            if(total == rules[index]["score"]) {
              diags[rules[index]["diagnosaCode"].toString()] = { "type": 1, "weight": total};
            }
            if(total < rules[index]["score"]) {
              diags[rules[index]["diagnosaCode"].toString()] = { "type": 0, "weight": total};
            }

          }
        }
      }
    }
    print(diags);
    return diags;
  }
  bool isNotZero(double? value) {
    if(value != null && value > 0) return true;
    return false;
  }
  bool compareCF(List<double?> arr1, List<double?> arr2) {
  if (arr1.length != arr2.length) {
    return false;
  }

  for (int i = 0; i < arr1.length; i++) {
    if (arr1[i] != arr2[i]) {
      return false;
    }
  }
  
  return true;
}

  double cf(double previousCF, double weight) {
    // print("${previousCF} + ${weight} + * ${(1 - previousCF)}");
    if(previousCF == 0 && weight != 0) {
      print("${previousCF} + ${weight} + * ${1} - ${weight}");
      return previousCF + weight * (1 - weight);  
    }
    return previousCF + weight * (1 - previousCF);
  }

  List<Map<String, dynamic>> rules = [
    {
      "id": 1,
      "title": "Nyeri Punggung Akibat Sendi Facet",
      "solusi": [
        "1. Fokus terapi konservatif facet join syndrome difokuskan untuk mengkoreksi pergerakan tulang belakang\n",
        "2. Latihan pereggangan dan menghilangkan rasa sakit selama proses pemulihan"
      ],
      "diagnosaCode": DIAGNOSACODES.GN001,
      "rules": [0.8,0.8,0.8,0.8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
      "score": 0.9984
    },
    {
      "id": 2,
      "title": "Nyeri Punggung Akibat Proses Denegratif",
      "solusi": [
        "1. Membatasi makanan yg bisa membuat penyakit dengratif\n",
        "2. Melakukan olahraga rutin\n",
        "3. Mengurangi asupan kalori pada makanan"
      ],
      "diagnosaCode": DIAGNOSACODES.GN002,
      "rules": [0.0,0.0,0.0,0.0,0.8,0.8,0.8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
      "score": 0.9664
    },
    {
      "id": 3,
      "title": "Nyeri Punggung Karena HNP",
      "solusi": [
        "1. Duduk dan berdiri dengan postur tegap dengan baik \n",
        "2. Banyak beristirahat\n",
        "3. Berhati-hati saat mengangkat beban berat"
      ],
      "diagnosaCode": DIAGNOSACODES.GN003,
      "rules": [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.8,0.8,0.8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
      "score": 0.9664
    },
    {
      "id": 4,
      "title": "Nyeri Punggung Karena Spinal Stenosis",
      "solusi": [
        "1. Mengkonsumsi obat sebagai langkah awal pengobatan \n",
        "2. Fisioterapi bermanfaat untuk menigkatkan keseimbangan tubuh\n",
        "3. Suntikan kortikosteroid untuk mengurangi peradangan saraf yang terjepi dan meredakan nyeri"
      ],
      "diagnosaCode": DIAGNOSACODES.GN004,
      "rules": [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.8,0.8,0.8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
      "score": 0.9664
    },
    {
      "id": 5,
      "title": "Nyeri Punggung Karena Sendi Facet Yang Terkunci",
      "solusi": [
        "1. Hot Pack dan pijat otot untuk melemaskan otot yang kaku \n",
        "2. Mobilisasi sendi faset dengan fisioterapi untuk merenggangkan kapsul sendi facet yang terkunci\n",
      ],
      "diagnosaCode": DIAGNOSACODES.GN005,
      "rules": [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.8,0.8,0.8,0.0,0.0,0.0,0.0,0.0,0.0],
      "score": 0.9664
    },
    {
      "id": 6,
      "title": "Nyeri Punggung Akibat Radang di Sendi Sacroiliac",
      "solusi": [
        "1. Olahraga sperti berjalan kaki bisa membantu pemulihan yeri facet akibat radang \n",
        "2. Posisi tidur bisa membantu untuk mengatasi sakit punggung\n",
        "3. Cara mengatasi sakit punggung juga bisa melalui terapi fisik"
      ],
      "diagnosaCode": DIAGNOSACODES.GN006,
      "rules": [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.8,0.8,0.8,0.0,0.0,0.0],
      "score": 0.9664
    },
    {
      "id": 7,
      "title": "Nyeri Punggung Akibat Radang di Bantalan Tulang Belakang",
      "solusi": [
        "1. Melakukan latihan tertentu untuk melihat seberapa besar kekuatan kita \n",
        "2. Melihat fleksibilitas seperti gerakan memutar dan menekuk\n",
        "3. Menilai area yang sakit dengan menyentuh bagian tubuh tertentu"
      ],
      "diagnosaCode": DIAGNOSACODES.GN007,
      "rules": [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.8,0.8,0.8],
      "score": 0.9664
    },

    
  ];
}