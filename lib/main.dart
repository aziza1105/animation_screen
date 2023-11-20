import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SecondScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOut;

                  var scaleTween = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(begin, end, curve: curve),
                    ),
                  );

                  return ScaleTransition(
                    scale: scaleTween,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text('Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ThirdScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOut;

                  var rotateTween = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(begin, end, curve: curve),
                    ),
                  );

                  return RotationTransition(
                    turns: rotateTween,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text('Third Screen'),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    FirstScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeInOut;

                  var fadeTween = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(begin, end, curve: curve),
                    ),
                  );

                  return FadeTransition(
                    opacity: fadeTween,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text('First Screen'),
        ),
      ),
    );
  }
}




// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main(List<String> args) {
//   runApp(const InitialScreen());
// }
//
// class InitialScreen extends StatefulWidget {
//   const InitialScreen({super.key});
//
//   @override
//   State<InitialScreen> createState() => _InitialScreenState();
// }
//
// class _InitialScreenState extends State<InitialScreen>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(builder: (context) {
//         return Scaffold(
//           body: Column(
//             children: [
//               MaterialButton(
//                 height: 60,
//                 minWidth: 300,
//                 color: Colors.black,
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(seconds: 10),
//                       reverseTransitionDuration: const Duration(seconds: 10),
//                       transitionsBuilder:
//                           (_, animation, secondaryAnimation, child) {
//                         return AnimatedBuilder(
//                           animation: animation,
//                           child: const SecondScreen(),
//                           builder: (_, child) {
//                             const begin = 0.0;
//                             const end = 2 * pi;
//                             var tween = Tween<double>(begin: begin, end: end);
//                             return Transform.rotate(
//                               angle: animation.drive(tween).value,
//                               child: child,
//                             );
//                           },
//                         );
//                       },
//                       pageBuilder: (_, animation, secondaryAnimation) {
//                         return const SecondScreen();
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//
//
//           floatingActionButton: Builder(builder: (context) {
//             return FloatingActionButton(
//               onPressed: () {},
//               child: const Icon(Icons.arrow_right),
//             );
//           }),
//         );
//       }),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Hero(
//             tag: 'hero-button',
//             child: MaterialButton(
//               height: 60,
//               minWidth: 300,
//               color: Colors.black,
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }