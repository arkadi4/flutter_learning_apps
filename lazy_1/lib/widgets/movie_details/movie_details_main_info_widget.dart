import 'package:flutter/material.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _OverviewTextWidget(),
        ),
        SizedBox(height: 20,),
        _PeopleWidget(),
      ],
    );
  }
}

class _OverviewTextWidget extends StatelessWidget {
  const _OverviewTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Overview text ooooooooooooooooooooooooooooooooooooooooooooo'
        'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'
        'ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      //   Container(
      //     width: double.infinity,
      //     height: 500,
      //     color: Colors.red,
      //     child: Image(
      //       image: AssetImage('images/topPoster1.png'),
      //     ),
      //   ),
        FittedBox(
          // width: double.infinity,
          child: Image(
            image: AssetImage('images/topPoster1.png'),
            // width: 100,
            // height: 200,
            // fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage('images/topPoster.png'))
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Afonya long title _______________________________',
                // '_____________________________________________________________',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: ' (1975)',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            )
          ),
        ],
      )
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.play_arrow),
              Text('User Score'),
            ],
          )
        ),
        Container(
          color: Colors.grey,
          width: 1,
          height: 15,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.play_arrow),
              Text('Play trailer'),
            ],
          ),
        )
      ],
    );
  }
}


class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text('Summary text __________________________________________'
            '_______________________________________________________________',
            maxLines: 3,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
    );
    final jobTitleStyle = TextStyle(
      color: Colors.white,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Danelia', style: nameStyle,),
                Text('Director', style: jobTitleStyle,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kuravlev', style: nameStyle,),
                Text('actor', style: jobTitleStyle,),
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Danelia', style: nameStyle,),
                Text('Director', style: jobTitleStyle,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kuravlev', style: nameStyle,),
                Text('actor', style: jobTitleStyle,),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
