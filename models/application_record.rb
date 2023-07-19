class ApplicationRecord

  def self.create_table
    
    Database.instance.execute <<-SQL
      CREATE TABLE IF NOT EXISTS #{name.downcase.pluralize} (
        #{schema}
      );
    SQL

  end 

  def self.list

    DatabaseConnection.run_sql("SELECT * FROM #{name.downcase.pluralize}") do |row|
      p row
    end

  end

  def self.find(id)

    new

  end   

 def update(column, value)

    DatabaseConnection.run_sql("UPDATE #{name.downcase.pluralize} SET #{column} = ? WHERE id = ?") 
    binding.pry

  end


end 
