import 'package:ai_lawyer/src/core/core.dart';
import 'package:ai_lawyer/src/presentations/equal_law/view/constitution/Constitution_list/list_constitution.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class ConstitutionKyrgyzstan extends StatelessWidget {
  const ConstitutionKyrgyzstan({super.key});

  @override
  Widget build(BuildContext context) {
    final constitutions = ListConstitution.getAllConstitutions();

    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: CustomAppBar(
              showArrowBackButton: true,
              title: "Конституции",
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: constitutions.length,
              itemBuilder: (context, index) {
                final constitution = constitutions[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      title: Text(
                        constitution.year,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp,
                        ),
                      ),
                      subtitle: Text(
                        constitution.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.5.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Share.share(
                                "${constitution.year}: ${constitution.description}",
                              );
                            },
                            child: Icon(
                              Icons.reply,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                          SizedBox(
                            width: 20.sp,
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      "${constitution.year}: ${constitution.description}"));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Color(0xfff141718),
                                  content: Text(
                                    'Текст скопирован!',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.copy,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
