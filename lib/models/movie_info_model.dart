class MovieInfo{
  late String poster_path;
  late String original_title;
  late List<dynamic> genre_ids;
  late num vote_average;
  late String releaseDate;
  int id;
  MovieInfo({required this.poster_path, required this.original_title,
    required this.vote_average, required this.genre_ids, required this.releaseDate, required this.id});
}