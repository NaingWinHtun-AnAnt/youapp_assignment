import 'package:youapp_assignment/data/vos/profile_vo.dart';

ProfileVO getMockProfile() => ProfileVO(
      email: "email@gmail.com",
      username: "User Name",
      interests: ["interest 1, interest 2"],
      displayName: "Display Name",
      gender: "Male",
      birthday: "02 01 1995",
      horoscope: "Horoscope",
      zodiac: "Zodiac",
      height: "170 cm",
      weight: "150 lb",
      profilePhoto: "photo_url",
    );

String getMockString() => "Success Fully Get Mock Data";
