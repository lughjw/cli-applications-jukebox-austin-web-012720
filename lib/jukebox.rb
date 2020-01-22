# Add your code here
def run(songs)
  print "Enter your name: "
  user_name = gets.strip
  puts "Welcome #{user_name}!"
  help
  command = get_command
  until command == "exit" do
    case command
    when "help"
      help
    when "play"
      play(songs)
    when "list"
      list(songs)
    else
      puts "Invalid Command"
    end
    
    command = get_command
  end
  exit_jukebox
end

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def play(songs)
  list(songs)
  puts "Please enter a song name or number:"
  song = gets.strip
  song_index = song.scan(/\d+/).first.to_i-1
  if song_index != nil && song_index >= 0 && song_index < songs.size
    song = songs[song_index]
  elsif !songs.contains?(song)
    puts "Invalid input, please try again"
  end
  
  puts "Playing #{song}"
  
  
end

def list(songs)
  songs.each_with_index do |song, i|
    puts "#{i+1}. #{song}"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def get_command
  gets.strip
end