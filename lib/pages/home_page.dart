import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youapp_assignment/blocs/home_bloc.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/pages/edit_interest_page.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';
import 'package:youapp_assignment/resources/strings.dart';
import 'package:youapp_assignment/utils/navigation_utility.dart';
import 'package:youapp_assignment/utils/sizes_utilities.dart';
import 'package:youapp_assignment/utils/string_utility.dart';
import 'package:youapp_assignment/widgets/back_button_view.dart';
import 'package:youapp_assignment/widgets/gradient_text_view.dart';
import 'package:youapp_assignment/widgets/text_field_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          leadingWidth: 100,
          leading: BackButtonView(
            onTap: () => popBack(context),
            margin: const EdgeInsets.only(left: marginMedium2),
          ),
          title: Consumer<HomeBloc>(
            builder: (BuildContext context, HomeBloc bloc, Widget? child) =>
                Text(
              bloc.mProfile?.displayName ?? "-",
              style: const TextStyle(
                color: colorWhite,
                fontSize: textRegular,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: colorPrimary,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: marginMedium2Large,
              horizontal: marginMedium,
            ),
            child: Consumer<HomeBloc>(
              builder: (BuildContext context, HomeBloc bloc, Widget? child) =>
                  Column(
                children: [
                  ProfilePictureView(
                    profile: bloc.mProfile,
                  ),
                  const SizedBox(
                    height: marginMedium2Large,
                  ),
                  AddAboutCardView(
                    profile: bloc.mProfile,
                    title: txtAbout,
                    description: txtAboutDescription,
                    onTapEdit: () => bloc.onChangeAboutStatus(),
                    aboutStatus: bloc.mStatus,
                    onTapSave: () => bloc.onTapSaveAndUpdate(),
                    onChangeDisplayName: (displayName) =>
                        bloc.onChangeDisplayName(displayName: displayName),
                    onChangeGender: (gender) =>
                        bloc.onChangeGender(gender: gender),
                    onTapBirthday: () async {
                      DateTime selectedDate = DateTime.now();

                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null && picked != selectedDate) {
                        selectedDate = picked;
                        bloc.onChangeBirthday(birthday: selectedDate);
                      }
                    },
                    onChangeHeight: (height) =>
                        bloc.onChangeHeight(height: height),
                    onChangeWeight: (weight) =>
                        bloc.onChangeWeight(weight: weight),
                    pickImage: () => bloc.pickImage(),
                    profileImage: bloc.image,
                    horoscope: bloc.horoscope,
                    zodiac: bloc.zodiac,
                    birthday: bloc.mBirthday,
                  ),
                  const SizedBox(
                    height: marginMedium2,
                  ),
                  AddInterestCardView(
                    title: txtInterest,
                    description: txtInterestDescription,
                    onTapEdit: () => navigateTo(
                      context,
                      const EditInterestPage(),
                    ),
                    interestList: bloc.mProfile?.interests ?? [],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddAboutCardView extends StatelessWidget {
  final ProfileVO? profile;
  final String title;
  final String description;
  final Function onTapEdit;
  final Function onTapSave;
  final AboutStatus aboutStatus;
  final Function(String) onChangeDisplayName;
  final Function(String) onChangeGender;
  final Function onTapBirthday;
  final Function(String) onChangeWeight;
  final Function(String) onChangeHeight;
  final String? horoscope;
  final String? zodiac;
  final Function pickImage;
  final File? profileImage;
  final String? birthday;

  const AddAboutCardView({
    super.key,
    required this.title,
    required this.description,
    required this.onTapEdit,
    required this.aboutStatus,
    required this.onTapSave,
    required this.onChangeDisplayName,
    required this.onChangeGender,
    required this.onTapBirthday,
    required this.onChangeWeight,
    required this.onChangeHeight,
    this.profile,
    required this.pickImage,
    required this.profileImage,
    required this.horoscope,
    required this.zodiac,
    required this.birthday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: margin14,
        left: marginMedium2Large,
        right: margin14,
        bottom: marginMedium2Large,
      ),
      decoration: BoxDecoration(
        color: colorAddDataCard,
        borderRadius: BorderRadius.circular(addDataCardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: textRegular,
                  fontWeight: FontWeight.w700,
                  color: colorWhite,
                ),
              ),
              aboutStatus == AboutStatus.edit
                  ? GradientTextView(
                      text: txtSaveAndUpdate,
                      textSize: textSmall,
                      onTap: () => onTapSave(),
                      visibleUnderLine: false,
                      colorList: goldenColorList,
                    )
                  : GestureDetector(
                      onTap: () => onTapEdit(),
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: colorWhite,
                      ),
                    ),
            ],
          ),
          const SizedBox(
            height: marginLarge,
          ),
          aboutStatus == AboutStatus.edit
              ? AddAboutDataView(
                  onChangeDisplayName: (displayName) =>
                      onChangeDisplayName(displayName),
                  onChangeGender: (gender) => onChangeGender(gender),
                  onTapBirthday: () => onTapBirthday(),
                  onChangeHeight: (height) => onChangeHeight(height),
                  onChangeWeight: (weight) => onChangeWeight(weight),
                  pickImage: () => pickImage(),
                  birthday: birthday,
                  profileImage: profileImage,
                  horoscope: horoscope,
                  zodiac: zodiac,
                )
              : aboutStatus == AboutStatus.fill
                  ? AboutDataView(
                      profile: profile,
                    )
                  : Text(
                      description,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorWhite.withOpacity(0.52),
                        fontSize: textRegular,
                      ),
                    ),
        ],
      ),
    );
  }
}

class AboutDataView extends StatelessWidget {
  final ProfileVO? profile;
  const AboutDataView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataView(
          label: txtBirthday,
          data: "${profile?.birthday ?? "-"} (Age -)",
        ),
        const SizedBox(
          height: marginMedium2,
        ),
        DataView(
          label: txtHoroscope,
          data: profile?.horoscope ?? "",
        ),
        const SizedBox(
          height: marginMedium2,
        ),
        DataView(
          label: txtZodiac,
          data: profile?.zodiac ?? "",
        ),
        const SizedBox(
          height: marginMedium2,
        ),
        DataView(
          label: txtHeight,
          data: profile?.height ?? "-",
        ),
        const SizedBox(
          height: marginMedium2,
        ),
        DataView(
          label: txtWeight,
          data: profile?.weight ?? "-",
        ),
        const SizedBox(
          height: marginMedium2,
        ),
      ],
    );
  }
}

class DataView extends StatelessWidget {
  final String label;
  final String data;

  const DataView({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: colorWhite.withOpacity(0.33),
            fontWeight: FontWeight.w500,
            fontSize: textRegular,
          ),
        ),
        const SizedBox(
          width: margin4,
        ),
        Text(
          data,
          style: const TextStyle(
            color: colorWhite,
            fontWeight: FontWeight.w500,
            fontSize: textRegular,
          ),
        ),
      ],
    );
  }
}

class AddAboutDataView extends StatelessWidget {
  final Function(String) onChangeDisplayName;
  final Function(String) onChangeGender;
  final Function onTapBirthday;
  final Function(String) onChangeWeight;
  final Function(String) onChangeHeight;
  final String? birthday;
  final String? horoscope;
  final String? zodiac;
  final Function pickImage;
  final File? profileImage;

  const AddAboutDataView({
    super.key,
    required this.onChangeDisplayName,
    required this.onChangeGender,
    required this.onTapBirthday,
    required this.onChangeWeight,
    required this.onChangeHeight,
    required this.pickImage,
    required this.profileImage,
    required this.horoscope,
    required this.zodiac,
    this.birthday,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: emptyAddImageSize,
              height: emptyAddImageSize,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: colorWhite.withOpacity(
                  0.08,
                ),
                borderRadius: BorderRadius.circular(
                  addEmptyImageRadius,
                ),
              ),
              child: profileImage == null
                  ? Center(
                      child: GestureDetector(
                        onTap: () => pickImage(),
                        child: const Icon(
                          Icons.add,
                          color: colorWhite,
                        ),
                      ),
                    )
                  : Image.file(
                      profileImage!,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: marginMedium2,
            ),
            const Text(
              txtAddImage,
              style: TextStyle(
                fontSize: textSmall,
                color: colorWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: marginLarge,
        ),
        AddAboutDataTextView(
          text: txtDisplayName,
          hintText: hintTxtDisplayName,
          onChange: (displayName) => onChangeDisplayName(displayName),
        ),
        const SizedBox(
          height: margin12,
        ),
        AddAboutDataTextView(
          text: txtGender,
          hintText: hintTxtGender,
          onChange: (gender) => onChangeGender(gender),
        ),
        const SizedBox(
          height: margin12,
        ),

        AddAboutDataTextView(
          text: txtBirthday,
          hintText: birthday ?? hintTxtBirthday,
          onChange: (birthday) {},
          readOnly: true,
          onTap: () => onTapBirthday(),
        ),
        const SizedBox(
          height: margin12,
        ),
        AddAboutDataTextView(
          text: txtHoroscope,
          hintText: horoscope ?? hintTxtHoroscope,
          readOnly: true,
          onChange: (horoscope) {},
        ),
        const SizedBox(
          height: margin12,
        ),
        AddAboutDataTextView(
          text: txtZodiac,
          hintText: zodiac ?? hintTxtZodiac,
          readOnly: true,
          onChange: (zodiac) {},
        ),
        const SizedBox(
          height: margin12,
        ),
        AddAboutDataTextView(
          text: txtHeight,
          hintText: hintTxtHeight,
          onChange: (height) => onChangeHeight(height),
        ),
        const SizedBox(
          height: margin12,
        ),
        AddAboutDataTextView(
          text: txtWeight,
          hintText: hintTxtWeight,
          onChange: (weight) => onChangeWeight(weight),
        ),
      ],
    );
  }
}

class AddAboutDataTextView extends StatelessWidget {
  final String text;
  final String hintText;
  final Function(String)? onChange;
  final bool readOnly;
  final Function? onTap;

  const AddAboutDataTextView({
    super.key,
    required this.text,
    required this.hintText,
    this.onChange,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: textRegular,
              color: colorWhite.withOpacity(
                0.33,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: TextFieldView(
            onTap: onTap,
            readOnly: readOnly,
            textAlign: TextAlign.right,
            onChange: (data) => onChange?.call(data),
            hintText: hintText,
            boxBorder: Border.all(
              color: colorWhite.withOpacity(
                0.22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddBirthdayTextView extends StatelessWidget {
  final String text;
  final String? textValue;
  final Function onTap;

  const AddBirthdayTextView({
    super.key,
    required this.text,
    required this.textValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: textRegular,
              color: colorWhite.withOpacity(
                0.33,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: GestureDetector(
            onTap: () => onTap(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(marginMedium2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(textFieldBorderRadius),
                color: colorWhite.withOpacity(0.06),
              ),
              child: Text(
                textValue ?? hintTxtBirthday,
                textAlign: TextAlign.right,
                style: textValue == null
                    ? TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: textRegular,
                        color: colorWhite.withOpacity(0.4),
                      )
                    : const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: textRegular,
                        color: colorWhite,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddInterestCardView extends StatelessWidget {
  final List<String> interestList;
  final String title;
  final String description;
  final Function onTapEdit;

  const AddInterestCardView({
    super.key,
    required this.title,
    required this.description,
    required this.onTapEdit,
    required this.interestList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: margin14,
        left: marginMedium2Large,
        right: margin14,
        bottom: marginMedium2Large,
      ),
      decoration: BoxDecoration(
        color: colorAddDataCard,
        borderRadius: BorderRadius.circular(addDataCardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: textRegular,
                  fontWeight: FontWeight.w700,
                  color: colorWhite,
                ),
              ),
              GestureDetector(
                onTap: () => onTapEdit(),
                child: const Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: colorWhite,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: marginLarge,
          ),
          interestList.isEmpty
              ? Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colorWhite.withOpacity(0.52),
                    fontSize: textRegular,
                  ),
                )
              : Wrap(
                  spacing: margin4,
                  runSpacing: marginMedium,
                  children: List.generate(
                    interestList.length,
                    (index) => InterestChipView(
                      text: interestList[index],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ProfilePictureView extends StatelessWidget {
  final ProfileVO? profile;

  const ProfilePictureView({
    super.key,
    this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: getScreenSizeByPercent(context: context, percent: 100),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: getScreenSizeByPercent(
            context: context,
            percent: 23.5,
          ),
          decoration: BoxDecoration(
            color: colorEmptyProfilePhotoBackground,
            borderRadius:
                BorderRadius.circular(emptyProfilePictureBorderRadius),
          ),
          child: Visibility(
            visible: profile?.profilePhoto.isNotNullOrEmpty() ?? false,
            child: Image.file(
              File(profile?.profilePhoto ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(
            marginMedium2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${profile?.displayName}, 28",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: textLarge,
                  color: colorWhite,
                ),
              ),
              const SizedBox(
                height: margin6,
              ),
              Text(
                profile?.gender ?? "-",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: textSmall,
                  color: colorWhite,
                ),
              ),
              const SizedBox(
                height: marginMediumLarge,
              ),
              Row(
                children: [
                  CustomChipView(
                    text: profile?.horoscope ?? "-",
                  ),
                  const SizedBox(
                    width: marginMedium2,
                  ),
                  CustomChipView(
                    text: profile?.zodiac ?? "-",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomChipView extends StatelessWidget {
  final String text;

  const CustomChipView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: marginMedium2,
        vertical: marginMedium,
      ),
      decoration: BoxDecoration(
        color: colorWhite.withOpacity(
          0.06,
        ),
        borderRadius: BorderRadius.circular(
          radiusImpossible,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.ac_unit,
            color: colorWhite,
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Text(
            text,
            style: const TextStyle(
              color: colorWhite,
              fontSize: textRegular,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class InterestChipView extends StatelessWidget {
  final String text;

  const InterestChipView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: marginMedium,
        horizontal: marginMedium2,
      ),
      decoration: BoxDecoration(
        color: colorWhite.withOpacity(0.06),
        borderRadius: BorderRadius.circular(radiusImpossible),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: colorWhite,
          fontWeight: FontWeight.w600,
          fontSize: textSmall,
        ),
      ),
    );
  }
}
