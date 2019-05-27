#Our CLI Controller
class TeamGift::CLI

  def call
    puts "Thanks for choosing Sports Treasures to create a thoughtful end of season gift.
    "
    list_sports
    menu
    goodbye
  end

  def list_sports
    puts "Which sport do you play?"
    @sports = TeamGift::SportsList.all
    @sports.each.with_index(1) do |sport, i|
      puts "#{i}." " #{sport.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the sport you play, type list to see list, or type exit to exit"
      input = gets.strip.downcase
      if input.to_i == 1 ||  input.to_i == 2
        the_sport = @sports[input.to_i-1]
        puts "#{the_sport.name}"
      elsif input == "list"
        list_sports
      elsif input.to_i == 3 || input.to_i > 3
        puts "Please enter a number corresponding to the sport you played."
        list_sports
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "We appreciate your sharing your perspective to create a personalized Sports Treasures team gift!"
  end

end