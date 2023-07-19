class Game
  attr_reader :player

  def initialize(questions)
    @score = 0
    @questions = questions
    @player = nil
  end

  def new_player
    puts "Enter your first name"
    player_name = gets.chomp
    puts "Add your email to store your score"
    email = gets.chomp
    @player = Player.new(player_name, email)
  end

  def play
    new_player if @player.nil?
    
    @questions.each do |question|
      correct = question.ask
      if correct
        @score += 1
        puts scoreboard
      else
        puts wrong_answer
        puts scoreboard
        puts final_score
        break
      end
    end

    update_player_score
  end

  def wrong_answer
    puts "Wrong answer! You are out of the game"
  end

  def scoreboard
    "You got #{@score}/#{@questions.length}"
  end

  def final_score
    "Thanks for playing, #{player.name}, your score of #{@score} has been saved"
  end

  def update_player_score
    @player.update_score(@score)
  end

end
