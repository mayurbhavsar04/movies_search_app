class Movie {
  String imageUrl;
  String title;
  String genre;
  String imdbRating;

  Movie({
    this.imageUrl,
    this.title,
    this.genre,
    this.imdbRating,
  });
}

final List<Movie> movies = [
  Movie(
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_SX300.jpg',
    title: 'Sherlock Holmes',
    genre: 'Action, Adventure, Mystery',
    imdbRating: '7.5',
  ),
  Movie(
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BMGZlNTY1ZWUtYTMzNC00ZjUyLWE0MjQtMTMxN2E3ODYxMWVmXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg',
    title: 'Spider-Man',
    genre: 'Fantasy, Sci-fi',
    imdbRating: '8.5',
  ),
  Movie(
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BOTg1NDI1MjEyMl5BMl5BanBnXkFtZTgwOTA5MTgwNjM@._V1_SX300.jpg',
    title: 'The Nutcracker',
    genre: 'Adventure, Family',
    imdbRating: '7.0',
  ),
  Movie(
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BMTYzMDM4NzkxOV5BMl5BanBnXkFtZTgwNzM1Mzg2NzM@._V1_SX300.jpg',
    title: 'Toy Story 4',
    genre: 'Adventure, Fantasy',
    imdbRating: '9.5',
  ),
];
