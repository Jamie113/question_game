# Any method that is common to all models should be defined here.

class ApplicationRecord

  # Return a string that looks like this:
  # "name varchar, email varchar, score integer"
  def self.sqlize_schema
    self::SCHEMA.map do |column, type|
      "#{column} #{type}"
    end.join(", ")
  end

  def self.column_names
    self::SCHEMA.keys.join(", ")
  end

  def self.table_name
    name.downcase.pluralize
  end

  # This creates a table in the database for the model.
  # It uses the sqlize_schema method to generate the schema.
  def self.create_table
    Database.execute <<-SQL
      CREATE TABLE IF NOT EXISTS #{table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Always have an id
        #{sqlize_schema}
      );
    SQL
  end

  # This method is used to create a new record in the database.
  # It takes a hash of attributes as an argument.
  # For example, if you have a Player model with name, email, and score,
  # you could do this:
  # Player.create(name: "Bob", email: "bob@example", score: 100)
  # This method will generate the following SQL:
  # INSERT INTO players (name, email, score) VALUES ('Bob', 'bob@example', 100);
  def self.create(attributes)
    columns = attributes.keys.join(", ")
    values = attributes.values.map { |value| "'#{value}'" }.join(", ")
    Database.execute <<-SQL
      INSERT INTO #{table_name} (#{columns})
      VALUES (#{values});
    SQL
  end

  # This method is used to list all records in the database.
  def self.list
    Database.execute("SELECT * FROM #{table_name}") do |row|
      p row
    end
  end

  # This method is used to find a record by its id. 
  # For example, if you have a Player model with id 1, you could do this:
  # Player.find(1)
  # This method will generate the following SQL:
  # SELECT * FROM players WHERE id = 1;
  # It will return a new Player object with the id 1.
  # If no record is found, it will raise an error.
  def self.find(id)
    record = Database
      .execute("SELECT #{column_names} FROM #{table_name} WHERE id = #{id}")
      .first
    raise "Couldn't find #{name} with id #{id}" if record.nil?

    data_hash = self::SCHEMA.keys.zip(record).to_h
    
    new(id, data_hash)
  end 

  # This method is used to update a record in the database.
  # It takes a column name and a value as arguments.
  # For example, if you have a Player model with id 1, you could do this:
  # Player.find(1).update("score", 100)
  # This method will generate the following SQL:
  # UPDATE players SET score = 100 WHERE id = 1;
  def update(column, value)
    Database.execute <<-SQL
      UPDATE #{table_name}
      SET #{column} = '#{value}'
      WHERE id = #{id};
    SQL
  end
end 
