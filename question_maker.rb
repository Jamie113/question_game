class QuestionMaker
  def get_json
    url = URI('https://opentdb.com/api.php?amount=15&type=multiple')
    
    test = Net::HTTP.get(url)
    JSON.parse(test)
  end

  def create_questions
    get_json['results'].map do |result|
      Question.new(
        category: result['category'],
        type: result['type'],
        difficulty: result['difficulty'],
        question: result['question'],
        correct_answer: result['correct_answer'],
        incorrect_answers: result['incorrect_answers']
      )
    end
  end
end
