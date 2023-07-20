class Player < ApplicationRecord

  SCHEMA = {
    name:  :varchar,
    email: :varchar,
    score: :integer
  }

  create_table

  attr_accessor :name, :id

  def initialize(id, data)
    @id = id
    @name = data[:name]
    @email = data[:email]
    @score = data[:score]
  end 

end

binding.pry
