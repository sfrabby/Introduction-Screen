PageViewModel(
title: "Title of blue page",
body: "Welcome to the app! This is a description on a page with a blue background.",
image: Center(
child: Image.network("https://example.com/image.png", height: 175.0),
),
decoration: const PageDecoration(
pageColor: Colors.blue,
),
)