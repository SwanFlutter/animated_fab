
## Animated FAB

An Animated Floating Action Button (FAB) for Flutter that expands to reveal a list of sub-FABs with a beautiful animation. 
This package is designed to provide a user-friendly and visually appealing way to present multiple actions within a single FAB.


## Features

 - **Expandable FAB:** The main FAB expands to reveal a list of sub-FABs when pressed.
 - **Smooth Animation:** The expansion and collapse of the FABs are animated smoothly using a scale transition and elastic curve.
 - **Customizable:** You can customize the appearance of the main FAB and sub-FABs, including their size, color, icons, and tooltips.
 - **Easy to Use:** The package is simple to integrate into your Flutter project and requires minimal setup.
 - **Hero Animation:** The main FAB can participate in hero animations for smooth transitions between screens.




https://github.com/user-attachments/assets/71e7f329-474d-410d-847e-cdf81135296d



https://github.com/user-attachments/assets/08594125-04ea-4399-8e5d-10752f9ca53a



## Getting started


1.  **Add the dependency:**

    ```yaml
    dependencies:
      animated_fab: ^0.0.1
    ```
    
2.  **Import the package:**

    ```dart
    import 'package:animated_fab/animated_fab.dart';
    ```
    

## Usage


```dart
AnimatedFAB(
  backgroundColorFABItem: Colors.deepPurpleAccent,
  fABIcon: const SvgIcon(icon: SvgIconData('assets/feather_pan.svg')),
  mini: true,
  heroTag: 'fab-animated',
  tooltip: 'Elections',
  items: [
    FABItem(
      tooltip: 'Voting',
      child: Image.asset("assets/voteIcon/president.gif"),
      heroTag: 'fab-poll-outlined',
      onPressed: () async {
        await Get.to(() => const CreateVote());
        PublicAccessController.to.votes.sort(
          (e1, e2) => e2.registerDate.compareTo(e1.registerDate),
        );
      },
    ),
    FABItem(
      tooltip: "Poll",
      child: Image.asset("assets/voteIcon/voting.gif"),
      heroTag: 'fab-poll-rounded',
      onPressed: () async {
        await Get.to(() => const CreateVotePoll());
        PublicAccessController.to.votes.sort(
          (e1, e2) => e2.registerDate.compareTo(e1.registerDate),
        );
      },
    ),
    FABItem(
      tooltip: "Public request",
      child: Image.asset("assets/voteIcon/team.gif"),
      heroTag: 'fab-quiz',
      onPressed: () {},
    ),
  ],
)

```

## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.
For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/app_bar_auto_hide) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.
Thank you for using our package, and we look forward to hearing from you!
