class Player < ApplicationRecord

  SCHEMA = {id: :integer, name: :varchar, email: :varchar, score: :integer}

  create_table

  attr_accessor :name, :id

  def initialize(id, name)

    @id = id
    @name = name

  end 

end
