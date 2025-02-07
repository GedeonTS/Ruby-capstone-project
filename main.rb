require_relative './Book/books_handler'
require_relative './Book/book'
require_relative './Label/label_handler'
require_relative './Label/label'
require_relative './author/author'
require_relative './author/author_handler'
require_relative './genre/genre_handler'
require_relative './album/album_handler'
require_relative './album/music_album'
require_relative './games/game_handler'
require_relative './games/game'

# rubocop:disable Metrics/CyclomaticComplexity
class Main
  include BooksHandler
  include LabelsHandler
  include AuthorsHandler
  include GenreModule
  include MusicAlbumModule
  include GameHandler
  def initialize
    @books = load_books
    @labels = load_labels
    @genres = []
    @value = { games: [], authors: [] }
    @music_albums = MusicAlbum.read_file(@genres)
    add_genres(@genres)
  end

  def my_input(message)
    print message
    gets.chomp
  end

  def options1
    @options = [
      'List all books', 'List all music albums', 'List all games', 'List all genres', 'List all labels',
      'List all authors', 'Add a book', 'Add a music album', 'Add a game', 'Exit the app'
    ]
    puts '[1] => List all books'
    puts '[2] => List all music albums'
    puts '[3] => List all games'
    puts '[4] => List all genres'
    puts '[5] => List all lebels'
    puts '[6] => List all authors'
    puts '[7] => Add a book'
    puts '[8] => Add a music album'
    puts '[9] => Add a game'
    puts '[10] => Exit'
  end

  def options(input)
    case input
    when 1
      # list all books
      list_books
    when 2
      # list music albums
      list_all_music_albums(@music_albums)
    when 3
      list_all_games(@value)
    when 4
      # list all genres
      list_genres(@genres)
    when 5
      # list all labels
      list_labels
    when 6
      # fetch all authors
      list_authors
    when 7
      # add a book
      add_book
    when 8
      # add music album
      @music_albums << add_music_album(@genres)
    when 9
      add_game(@value)
    when 10
      nil
    else
      puts 'Please choose a valid number!'
    end
  end

  def run
    puts
    p '!!!Catalog of things App!!!'
    puts
    input = nil
    while input != 10
      puts 'Please choose an option by entrering a number: '
      options1
      print '[Input number]: '
      input = gets.chomp.strip.to_i
      options(input)
      puts
    end
    puts 'GOOD BYE👋'
  end
end
app = Main.new
app.run
# rubocop:enable Metrics/CyclomaticComplexity
