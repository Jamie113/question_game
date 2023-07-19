class Question 

  attr_reader :category,
              :type,
              :difficulty,
              :question,
              :correct_answer,
              :incorrect_answers
  
  def initialize(
      category:,
      type:,
      difficulty:,
      question:,
      correct_answer:,
      incorrect_answers:
  )
    @category = category
    @type = type
    @difficulty = difficulty
    @question = question
    @correct_answer = correct_answer
    @incorrect_answers = incorrect_answers
  end

  def answers
    @answers ||= (@incorrect_answers + [@correct_answer]).shuffle
  end 

    def ask
    
    puts "Ready, here is the question: #{@question}"
    puts "Select an answer", answers
    response = gets.chomp
    response == @correct_answer
  end
  
end
