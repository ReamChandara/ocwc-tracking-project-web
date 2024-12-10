import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/widget/alert_widget.dart';
import 'package:tracking_web/widget/textfield_widget.dart';

import '../config/theme/app_theme.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int visiblePagesCount;
  final Function(int) onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.visiblePagesCount = 6, // Default to 6 visible pages at a time
    required this.onPageChanged,
  });
  final double buttomWidth = 60;
  List<Widget> buildPageButtons() {
    List<Widget> pageButtons = [];

    // add "Previous" to first page
    pageButtons.add(
      InkWell(
        onTap: currentPage > 1 ? () => onPageChanged(1) : null,
        child: Container(
          width: buttomWidth,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.first_page,
              ),
              // Text(
              //   "back",
              //   style: AppTextStyle.regular16(),
              // ),
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );

    // Add "Back" button
    pageButtons.add(
      InkWell(
        onTap: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        child: Container(
          width: buttomWidth,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
              // Text(
              //   "back",
              //   style: AppTextStyle.regular16(),
              // ),
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );
    pageButtons.add(Text(
      " $currentPage / $totalPages",
      style: AppTextStyle.regular14(),
    ));
    // // Always show first page (1)
    // pageButtons.add(buildPageButton(1));

    // if (totalPages > 1) {
    //   if (totalPages > visiblePagesCount) {
    //     // If total pages are greater than visible pages count

    //     // If current page is far from the first page, add ellipsis (...)
    //     if (currentPage > visiblePagesCount - 1) {
    //       pageButtons.add(buildEllipsisButton(currentPage,
    //           forward: false)); // Jump backward button
    //     }

    //     // Determine the start and end of the page range to display
    //     int startPage = (currentPage - (visiblePagesCount ~/ 2))
    //         .clamp(2, totalPages - visiblePagesCount + 1);
    //     int endPage =
    //         (startPage + visiblePagesCount - 2).clamp(2, totalPages - 1);

    //     // Display the range of pages between the first and the last page
    //     for (int i = startPage; i <= endPage; i++) {
    //       pageButtons.add(buildPageButton(i));
    //     }

    //     // If current page is far from the last page, add ellipsis (...)
    //     if (currentPage < totalPages - visiblePagesCount + 1) {
    //       pageButtons.add(buildEllipsisButton(currentPage,
    //           forward: true)); // Jump forward button
    //     }

    //     // Always show last page (totalPages)
    //     pageButtons.add(buildPageButton(totalPages));
    //   } else {
    //     // When total pages are less than or equal to visiblePagesCount
    //     for (int i = 2; i <= totalPages; i++) {
    //       pageButtons.add(buildPageButton(i));
    //     }
    //   }
    // }

    // Add "Next" button
    pageButtons.add(
      InkWell(
        onTap: currentPage < totalPages
            ? () => onPageChanged(currentPage + 1)
            : null,
        child: Container(
          width: buttomWidth,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "Next",
              //   style: AppTextStyle.regular16(),
              // ),
              const Icon(
                Icons.chevron_right,
              ),
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );

    // Add "Go to Last Page" button
    pageButtons.add(
      InkWell(
        onTap:
            currentPage != totalPages ? () => onPageChanged(totalPages) : null,
        child: Container(
          width: buttomWidth,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "Last",
              //   style: AppTextStyle.regular16(),
              // ),
              const Icon(
                Icons.last_page,
              ),
            ].withSpaceBetween(width: 10),
          ),
        ),
      ),
    );

    pageButtons.add(
      SizedBox(
          height: 42,
          width: 150,
          child: TextFieldWidget(
            onFieldSubmitted: (val) {
              int num = int.parse(val);
              if (num > totalPages) {
                notificationAlert("បញ្ចូលលើសទំព័រសរុប");
              } else {
                onPageChanged(num);
              }
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: "page".tr,
            hintStyle: AppTextStyle.regular14(),
          )),
    );

    return pageButtons;
  }

  // Build the page number button
  Widget buildPageButton(int page) {
    return InkWell(
      onTap: () async {
        onPageChanged(page);
      },
      child: Container(
        width: 50,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: page == currentPage ? AppTheme.primaryswatch : null,
          // color: AppTheme.primaryswatch,
          borderRadius: BorderRadius.circular(10),
          border:
              page == currentPage ? null : Border.all(color: Colors.grey[300]!),
        ),
        child: Text("$page",
            style: TextStyle(
                color: page == currentPage ? Colors.white : Colors.black)),
      ),
    );
  }

  // Build the ellipsis (...) button
  Widget buildEllipsisButton(int page, {required bool forward}) {
    return InkWell(
      onTap: () {
        int jumpToPage;

        if (forward) {
          // If forward, jump ahead by `visiblePagesCount` pages
          jumpToPage = (currentPage + visiblePagesCount).clamp(1, totalPages);
        } else {
          // If backward, jump back by `visiblePagesCount` pages
          jumpToPage = (currentPage - visiblePagesCount).clamp(1, totalPages);
        }

        onPageChanged(jumpToPage); // Trigger page change
      },
      child: Container(
        width: 50,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color: page == currentPage ? AppTheme.primaryswatch : null,
          // color: AppTheme.primaryswatch,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: const Text('...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildPageButtons().withSpaceBetween(width: 6),
    );
  }
}
