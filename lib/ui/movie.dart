import 'package:flutter/material.dart';

import '../model/movies.dart';
import 'movie_ui/movie_ui.dart';

class MovieListView extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListView> {
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Arrow",
    "The Flash",
    "Spiderman",
    "Superman",
    "Batman",
    "Avengers",
    "Ironman",
    "Warcraft",
    "Blackwidow",
    "One Piece",
    "Naruto",
    "Hunter X Hunter",
    "Fairy Tail",
    "Boruto",
    "Black Clover",
    "Invincible",
    "Shangchi",
    "Silicon Valley",
    "Hitman",
    "Red Notice",
    "Hawkeye",
    "World Trigger",
    "Vikings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                movieCard(movieList[index], context),
                Positioned(
                  top: 10,
                  child: movieImage(movieList[index].images[0]),
                ),
              ],
            );
            //  Card(
            //   color: Colors.white,
            //   elevation: 4.2,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: NetworkImage(movieList[index].images[0]),
            //             fit: BoxFit.cover,
            //           ),
            //           // color: Colors.blue,
            //           borderRadius: BorderRadius.circular(14),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     //onTap: () => print("Movie Name: ${movies[index]}"),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => MovieDetail(
            //                 movieList[index].title, movieList[index])),
            //       );
            //     },
            //     title: Text(movieList[index].title),
            //     subtitle: Text(movieList[index].rated),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 54.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating}/10",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetail(movie.title, movie)));
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ??
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAh1BMVEX///+qqqqmpqajo6MvLy87OzsqKio4ODj6+vqzs7Ourq69vb3X19ft7e0yMjLy8vLMzMzk5OTd3d3Dw8OFhYXJyclAQECXl5fn5+fu7u5YWFhnZ2ebm5tERES4uLh4eHhPT0+Pj499fX1ubm4aGhokJCSGhoZTU1NeXl4dHR0TExMDAwNJSUkYj+jyAAAPXElEQVR4nO1d52KyOhhmhbBHqBRbtY7a2u/0/q/vZLLFqKCgfX60iow8eWcGiaL84Q9/+MPjwAp9P4sJMt8PrXsXpz+EGYqSlaPpuq4VIN+cVRKhLLx3Aa+AlXmJTXmpx0C52omXTU+kIZo5epWaVkX1J92ZoelI04pnqq5VxKTZbhJ5HkLUDhHyvChxba0iYE1XZ/EEZGl5q5wd5qa6naZGjNRVC2Fr+sobNUnLswU9Qk7WvIjBqsWF9mhJIiE9zC4526pClLPEkkSDlPAqhDMtL553qc8IcxXXtNm4HE/MS6bpLrpOxSzkilut4p5Kdz2Qw8tkX0mPwULcmjVnHMrqqaw4WtSfXoUR03lN9Xq756XwWFGw+Hq+MRYkq7j7ckRMfrrrD3Bz32Uc1fvpasbsT0+Gcnthwjg62UAP6IbFqng4fvQhjKPu3iEJ8Pijhw5bIa/IW5ujTxVUs4ewv8azbPos5xbPyjHTqZu7lQtA1GHrsxs9TlHmzo0fKKrUmd/madFNn8bBazW6waMs+2aPqoJVrD24U82Y1d8j8Q+Zdxs4NtKKvKkFlkGtcVj1cW9Rix1gGuQOdn+LqMkNLKGrCMQLaM5ARZjfPEa0gcWNQRx5TI3g/m1SRMsxQPuf5qHaTTOnI2C61HueSp3oUPp/JixnAJdKCGp2v/e8AsTf9EuRmPeATvp8kLDVp9OjBJP+7tcDkl4pRuMjyCn2pKiU4L3DYBOz3ih6Y5QgAZViD0EjHitBTvHq0D8fmxctg3rUKxM4i+QP44mDddgkz7ouDSHZg9NTcYbA1eUjanBlHQ0LomPXGFHUg54PDOonLo4ZmT6K5lI3SGNKv7DXgWrA+CJ9HbPLLcketRstcHE5o7F7GQGqaxeY4vwK/b4xqL843yE6kzBCBmKKZ0fFiy66Gy4Qh08EP645O10ISXHP6yVzromjd0B0rsp5k9JRAiKSM9qK1mXO6Z6grl8+trkT8qMCxDVKp+AkvmhDlmYQaGfEb6LTY0+4m0DyvoOcOoV8tA5bWjDq2bFlHCAxXJU50TvHZEcFVzJiaJPKZsoI5TwkEeE4u0dPI5ESonpW5BwXQhlLRBMWIRPiKXfqTNYKCYgQT8TEeLKOlIG40+6RjNVEY6EAiYmrrhOIlKeYzhSwT1gZTtAnmJGWgT1lZ7NIm2KjoopuCqQCptR30YaoUw1Xkw4VDGGXr7Em72cI7I6kzJu8nyEgpnYsOe1iPx10aCL5acr5jIB7VFCPoaRdarp6CCVlutjqTY/+MDkcE1Xc4YOmBWJubQ2M2QOEewYS9NtyU1WyL24CaKdCiE+3+6KKpFUd0YPECoJ2Lo9jhscM0ZEyQz+O88qxUGkJBX/1utm0rQ8wR+yCEMWl1UCq3xQU16vcc/D9ireoLbayDVve5nTQbpvPJ5mybfbBj6id6PNTMPJ3ZhAYRmCkjXvo+3+0ROo+MHf50Xcz2Bdl8D6DzwpFDQbkfkZgvrP2avyPfGX4PB3T2hK3TC4avoJluuafoyDgV0QmCL5fHe3DAMa2doUKTfosBy5TU4gkNNMlLNLjF5CCTXFJuIbQ+Fg46ubbgHt6WmwsU8Bhni4niYj1scS2Y0cYBm6NIdqnkAk23EH4dYxh+g6d/OB7WjC0jPQ9DfIrrGVqLLgEspdPhzGE5wxKt8krkUtKX0G6AUv2OWeIS5SnELvUrPaDFAyhG3zzg+vAhQXDFQxCA+ah6gMYpbDlcRnCc0KZ1RL6bLl4/woMy+RlEwxXASxMygrS78oVBUPDggazNmQAyygYHuCL8gHf+bfYBDU1UM5mqLRM5pNsG74CU/kCkH4WDA8pLJ2xAEbFaZQYKq/BKz22CRYlhpmJ7zMLzLl4hNHskz6XIXE11SM4gkj1shGGoQlpfx1naFXrHJUlqlRliAxWF4EZlxguYIr/QsiLtK4pAcW5DCOtHt0zyYyGMFReYUAKzRliShWFqClZmaGyNoi/SLA9hgVDABfkznDZej0DZmhnPB7KTLhADcfZPNLBENf/omA4g1U3B9Jd+WuFoRN84I+7wC4xxPpJnowMpvO+AWr6xRguIQ+H5lqinE2JNaXawVDRIYlsnGECg4p+/6bv5a8VhqFpij85ww9woP/X4IWWzYDC5aVrAsAZApIFkESgRYkbaFpd0rDMLoYKJAH6iAzTDhlS8VFB5gxD4ZpVekJZhv+wxMDSZAzPiofUc1YNdyU5YMEZOtD0BUMvgJXOD5PJop1hYrwxY8wZOpDHeqz75D7YcYn0xvM8tAGC4XlNO63eJeNI9nZzhkoKtoJhaJYzLuJ4KoG1ylAJAjcgDjVnuE6Xu3eC3TKl6vqbvpUu1y9kaNdzb9mhX8Fwhd2Dx+PhWyUe6sfjIfm/wYklCYqCITKWIqcOlmZMzzDn5dtdxtCtK6VsA18wVH7BB+IMbVhWU5j+Vq6oMUQmMEkNCIaYcSQAwIKdUdKJSxnWHYslGfALhkkANcDzUpAGea1vK0llk6Hy9UXDnWBolOh8Aeo3d6CU2l7KkASHcp5NnKtUT2LOEOtmuuQMvX0K+NVbCD+qV9QZiicyhjjUFM/Fak8cpgVTMzfll/QyX+rVwp8v21daMIyMpWCoJPvUeNdc+ysAwa52RTfD9zQtHUwBrR5/CSF8cdyV+gJBsCaHYtzA+uDYyXgM0hosz3L2ZbuhNuY/8fEQwB9RK/GBtfGDoNF5oJmfrI3P/wuGnyY+NftnLkoHX81/If/A2vg4gWEmHv/AvJH/I9MIIklaOYGXTUsVz80rMHMTt6glpH59bBctmoT4Ffh/maHluthxxq5bqWh6kGK2ePnYbmzxNXSTHK5MSetpaHykH3y6qDP6Yzg9/DGcPuqMpH3pZFD3pdLxcDKox0PpnGYyqOc00nnpZFDPS6XbFpNBvW0h3T6cDBodTxOf3t1Eo40v20+jWL7P1Tv/wDD3/doHgpB/Cf2W2eP4YKFI+MYUpZvOG0/IcbLns9FPI9vXpmg/Bm8hrs1y94z1uWcjh+E/47NoYmz2/9H/r/x/BdDYF22n1Q/v8IVbEbd+95XG5puZD5Lu66OUzXLW+9pk+0uVX9zuZQRW5eY5/mawbypcljpMRYt5kbecC0TBclm0f124NEwMAwIxOvwGKv0FuLVscvycZNhwLLJ93p6RHsRzjXLH6EEMDa/TQzHW28lwCw5p0V3uQoPGrzBJl3smxTpDUO8/OI5mn7fsuMUXfI8CTuALGPnx2OS9pMgwsrToMe1gaJkw2sFcGJghL0BsADYI12BYGS7oRDMNlU1MSb+0GD7zDJj7X8yA0d7AN+UV5h2KHQxtaGBapvA1BUNlCRjvKxg2JSY5frgiJdrANS8J66QmAEKDSAcTlqOw0A6Gb2TEvxhjqzBk6n8FwxarkxsDPhCtwgSYuDVo8kJFAXc/Lh2V+s6nKxxnGNPRtBcouvAxQz//hdG+gmFzDFhuHD8zqWf4hawXNzTFMNGWD3zjUpBCkRFthuMM2YioF4hJDoIh9jRCyZsMrZBhfmpSRcs4vtRcjAWkRDQxXLTj0zIsk/sG36SyDE1hoccZ8lHtFL4KhiJarEXtN6OFiIf/TviMtrkYUvNpACvO3ORd7Ek+csEloXPuO6FQRxnykV9RaZQh6xGF6TY7xlDEw1MM2+bTyMyJigJugLlFQOYT3gC3JjG1KSHji50Md3zkNzNzCw4QUcAsOUDz2njYJi+ZeW0fgsisIEC66mOjmGHDrUrMrDjGsNBjUe7C0ygHwFKdyz1N6wsJp+cmWubybcuGDlJOANFxW0yD3W6bpuyE7ZqPRxxjqMJ0x251WLJIWooWMz4z4HKGrWsNnp5f6sCUjx0EYMmnhnwTZYM8QuMqEBMmsFFFXQx/l0Dci2dAJYYxn79yMcP2+aWn5wh/g/fEZdBE1m1jfcW6GfEvwYqfkHwz1kcYegbQ+b2SHfitMfSuZdjO5eQ8b1RK0rBLYWkHjhPqlpsNLlGe45BsgGjuEYZfoJiKiP0Xqa0SwwW4Ukvb53mfnKu/AaUBwEVuemCdgtwoiyibsUkkRxiWR36xkpMMSLQt8CdjSceCL/elR6icMsQAlBplscHH7kkjr4gMJf91oI63YAi+XjgcEhlKkWlD2ygujoPkFOzF0j379S39FhdtIxIP1/k9WiaGFTj2vsWJd2bc/b581a+xZh8gDLhumka5jm3zB5vCxvhk7A1Yap+/BaB0prc3cW25JhsDDQLznYecdZBf9OPSIdm8kV/uXmjg2DszJ957mtkV/+vZKhNYZPM9/DKnsplf6Dge/ZWd7tg5ZopqV9oxjp2QLQbZr6tiC75VcY2DS+zaJXQxXB3rsHj4d9ee4P3Dx3+H9PHfA34QNe16l/vx38d//DUVnmBdjMdf2+QJ1qd5/DWGHn+dqCdY6+vx12t7gjX3Hn/dxCdY+/Lx1y99gjVoH38d4SdYC/rx1/N+gjXZH39d/SfYG+Hx97d4gj1KnmCfmcffK+gJ9nt6gj27Hn/ftSfYO+8J9j98/D0s+T6k424q+lftQ/oEe8k+wX7AT7Cn8+Pvy/0Ee6vjtuJYKVKCvbz5GumjjPwk0us9tWGjMUox6ZEgrq7xUaQEe1Ss2dg8qtszQa6o44mLdq8qykA8quqMI4GzSCbTN0FOURtDGu6TPKufMFEFCf1jaEwhWo5BVmKZ07q7d2CcUV0aqEPeckhbxb6nMVrEx2gD+gPipOVeiR4GGX3+oGEr0u+pqVRD+3eiVbBadO7R4R86t9EgagmDV2QLqPrcxguwRzm3HV+cO7esWP60W1rj7Na1yh54s+kMSLt9KPaZ1du3yOJ8m3m3W2eMNE9VdXdorxq67EF3WKjL4o9OhuRoJbwi75NIZVRVB+QYMn6ac78sCqmMozuEjfhMSTT1vu0ZT2Mc7b6LgWzGbwQr5XlMjpoW9aesYcQqTmvbX+kOQMweNd32+nAIFhYfu6Fz//a2QLziZdJXEvtNdcFCbn6rca2oGs6YXpGSeZeqa+jxmsI6PxvhfCWUF09XE3RuAUOUqPn1q/GoZxWWxy2IsnS9TE5jrcxz1eLCfqx5MFi5ohFVwzQjlB0XZ5ihiJDLr8AqPmp6DFY8yyVCaGq6rtluEnkeYjvgIeR5UeLa5AetOFFXZ+PyLZ0I0cwpRCOollH9SXdmZ1vu/YHNK7ErYmqACthOZA12nCCmlqwczEQvSZB8c1ZJp5FODlY499m2W5k/D6cstD/84Q9/qON/GLPYu3KMia8AAAAASUVORK5CYII='),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final String movieName;
  final Movie movie;

  MovieDetail(this.movieName, this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Name: $movieName"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailThumbnail(movie.images[0]),
          MovieHeaderPoster(movie),
          HorizontalLine(),
          MovieDetailsCast(movie),
          HorizontalLine(),
          MovieImages(movie.images),
        ],
      ),
    );
  }
}
