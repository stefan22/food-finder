require 'restaurant'

class Guide

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file"
    elsif Restaurant.file_create
      puts "Created restaurant file"
    else
      puts "Exiting \n"
      exit!
    end

  end

  def launch!
    intro
    loop do
      print ">"
      user_response = gets.chomp
      result = do_action(user_response)
      break if result == :quit
    end
    conclusion
  end

  def do_action(action)
      case action
      when 'find'
        puts "Finding..."
      when 'add'
        puts "Adding..."
      when 'list'
        puts "Listing"
      when 'quit'
        return :quit
      else
        puts "\n I don't understand that command"
      end
  end


  def intro
    puts "\n\n\n<<< Welcome to the Food finder guide >>> \n\n"
  end

  def conclusion
    puts "\n\n <<< Thanks for stopping by n hope to see u again soon! >>>\n"
  end


end
