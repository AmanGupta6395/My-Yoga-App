class YogaModel {
  static String YogaTable1 = "BeginnerYoga";
  static String YogaTable2 = "WeightLoss";
  static String YogaTable3 = "kidsYoga";
  static String YogaSummary = "YogaSummary";
  // static String YogaKey = "YogaKey";
  static String YogaWorkOutName = "YogaWorkOutName";
  static String BackImg = "BackImg";
  static String TimeTaken = "TimeTaken";
  static String TotalNoOfWorkout = "TotalNoOfWorkout";
  static String IDName = "ID";
  static String YogaName = "YogaName";
  static String SecondsOrNot = "SecondOrNot";
  static String SecondsOrTimes = "SecondsOrTimes";
  static String ImageName = "ImageName";
  static List<String>? YogaTable1ColumnName = [
    YogaModel.IDName,
    YogaModel.YogaName,
    YogaModel.SecondsOrNot,
    YogaModel.ImageName,
    YogaModel.SecondsOrTimes
  ];
}

class Yoga {
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImgUrl;
  final String SecondsOrTimes;

  const Yoga({
    this.id,
    required this.Seconds,
    required this.YogaTitle,
    required this.YogaImgUrl,
    required this.SecondsOrTimes,
  });

  Yoga copy({int? id, bool? Seconds, String? YogaTitle, String? YogaImgUrl,String? SeconsOrTimes}) {
    return Yoga(
      id: id ?? this.id,
      Seconds: Seconds ?? this.Seconds,
      YogaTitle: YogaTitle ?? this.YogaTitle,
      YogaImgUrl: YogaImgUrl ?? this.YogaImgUrl,
      SecondsOrTimes: SeconsOrTimes?? this.SecondsOrTimes
    );
  }

  static Yoga fromJson(Map<String, Object?> json) {
    return Yoga(
        id: json[YogaModel.IDName] as int?,
        Seconds: json[YogaModel.SecondsOrNot] == 1,
        YogaTitle: json[YogaModel.YogaName] as String,
        YogaImgUrl: json[YogaModel.ImageName] as String,
        SecondsOrTimes: json[YogaModel.SecondsOrTimes] as String
    );

  }

  Map<String, Object?> toJson() {
    return {
      YogaModel.IDName: id,
      YogaModel.SecondsOrNot: Seconds ? 1 : 0,
      YogaModel.YogaName: YogaTitle,
      YogaModel.ImageName: YogaImgUrl,
      YogaModel.SecondsOrTimes :SecondsOrTimes
    };
  }
}

class YogaSummary {
  final int? id;
  // final int? yogakey;
  final String YogaWorkOutName;
  final String BackImg;
  final String TimeTaken;
  final String TotalNoOfWorkout;

  const YogaSummary({this.id,
    // required this.yogakey,
    required this.YogaWorkOutName,
    required this.BackImg,
    required this.TimeTaken,
    required this.TotalNoOfWorkout});

  YogaSummary copy(
      {int? id,
    // int? yogakey,
    String? YogaWorkOutName,
    String? BackImg,
    String? TimeTaken,
    String? TotalNoOfWorkout}) {
    return YogaSummary(
      id: id ?? this.id,
      // yogakey: yogakey ?? this.yogakey,
      YogaWorkOutName: YogaWorkOutName ?? this.YogaWorkOutName,
      BackImg: BackImg ?? this.BackImg,
      TimeTaken: TimeTaken ?? this.TimeTaken,
      TotalNoOfWorkout: TotalNoOfWorkout ?? this.TotalNoOfWorkout,
    );
  }

  static YogaSummary fromJson(Map<String, Object?> json) {
    return YogaSummary(
      id: json[YogaModel.IDName] as int?,
      // yogakey: json[YogaModel.YogaKey] as int?,
      YogaWorkOutName: json[YogaModel.YogaWorkOutName] as String,
      BackImg: json[YogaModel.BackImg] as String,
      TimeTaken: json[YogaModel.TimeTaken] as String,
      TotalNoOfWorkout: json[YogaModel.TotalNoOfWorkout] as String,
    );
  }


  Map<String, Object?> toJson() {
    return {
      YogaModel.IDName: id,
      // YogaModel.YogaKey : yogakey,
      YogaModel.YogaWorkOutName: YogaWorkOutName,
      YogaModel.BackImg : BackImg,
      YogaModel.TimeTaken : TimeTaken,
      YogaModel.TotalNoOfWorkout : TotalNoOfWorkout,
    };
  }
}