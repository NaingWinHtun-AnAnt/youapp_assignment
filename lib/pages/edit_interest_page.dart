import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youapp_assignment/blocs/edit_interest_bloc.dart';
import 'package:youapp_assignment/resources/colors.dart';
import 'package:youapp_assignment/resources/dimens.dart';
import 'package:youapp_assignment/resources/strings.dart';
import 'package:youapp_assignment/utils/navigation_utility.dart';
import 'package:youapp_assignment/utils/sizes_utilities.dart';
import 'package:youapp_assignment/widgets/back_button_view.dart';
import 'package:youapp_assignment/widgets/gradient_background_view.dart';
import 'package:youapp_assignment/widgets/gradient_text_view.dart';

class EditInterestPage extends StatelessWidget {
  const EditInterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => EditInterestBloc(),
      child: Scaffold(
        body: GradientBackgroundView(
          child: Consumer<EditInterestBloc>(
            builder:
                (BuildContext context, EditInterestBloc bloc, Widget? child) =>
                    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: marginLarge,
                    left: marginMedium2,
                    right: marginMedium2Large,
                    bottom:
                        getScreenSizeByPercent(context: context, percent: 9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButtonView(
                        onTap: () => popBack(context),
                        margin: EdgeInsets.zero,
                      ),
                      GradientTextView(
                        text: txtSave,
                        onTap: () => bloc.onTapInterests(),
                        colorList: saveButtonColorList,
                      ),
                    ],
                  ),
                ),
                const GradientTextView(
                  text: txtTellAboutYourself,
                  colorList: goldenColorList,
                  margin: EdgeInsets.only(
                    left: marginXLarge,
                    right: marginXLarge,
                    bottom: margin12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: marginXLarge,
                  ),
                  child: const Text(
                    txtWhatInterest,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: titleLarge,
                      color: colorWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: marginLarge,
                ),
                CustomTextFieldWithChipView(
                  chipList: bloc.mInterestList,
                  onSubmitted: (interest) =>
                      bloc.onSubmittedInterest(interest: interest),
                  onTapDelete: (index) =>
                      bloc.onTapDeleteInterest(index: index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWithChipView extends StatefulWidget {
  final List<String> chipList;
  final Function(String) onSubmitted;
  final Function(int) onTapDelete;

  const CustomTextFieldWithChipView({
    super.key,
    required this.chipList,
    required this.onSubmitted,
    required this.onTapDelete,
  });

  @override
  State<CustomTextFieldWithChipView> createState() =>
      _CustomTextFieldWithChipViewState();
}

class _CustomTextFieldWithChipViewState
    extends State<CustomTextFieldWithChipView> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: marginMedium2Large,
      ),
      padding: EdgeInsets.only(
        left: margin12,
        top: widget.chipList.isEmpty ? constantZero : margin12,
        right: margin12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(textFieldBorderRadius),
        color: colorWhite.withOpacity(0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: margin4,
            runSpacing: marginMedium,
            children: List.generate(
              widget.chipList.length,
              (index) => AddInterestChipView(
                text: widget.chipList[index],
                onTapDelete: () => widget.onTapDelete(index),
              ),
            ).toList(),
          ),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: const InputDecoration(
              hintText: hintTxtWhatInterest,
              hintStyle: TextStyle(
                color: colorWhite,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: colorWhite,
            ),
            onSubmitted: (interest) {
              widget.onSubmitted(interest);
              _controller.clear();
              FocusScope.of(context).requestFocus(_focusNode);
            },
          ),
        ],
      ),
    );
  }
}

class AddInterestChipView extends StatelessWidget {
  final String text;
  final Function onTapDelete;

  const AddInterestChipView({
    super.key,
    required this.text,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(marginMedium),
      decoration: BoxDecoration(
        color: colorWhite.withOpacity(0.1),
        borderRadius: BorderRadius.circular(interestChipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.w600,
              fontSize: textSmall,
            ),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          GestureDetector(
            onTap: () => onTapDelete(),
            child: const Icon(
              Icons.close_rounded,
              color: colorWhite,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
