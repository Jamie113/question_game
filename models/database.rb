class Database

  def self.instance

    @instance ||= SQLite3::Database.new "datebase.db"

  end 
  
end 





# def self.database_instance 
#
#  db = SQLite3::Database.new "datebase.db"
#
#   db.execute <<-SQL
#     create table if not exists players (
#     name varchar(50),
#     email varchar(50),
#     score integer,
#     created_at datetime
#   );
#   SQL

#   db

# end 





  #def self.create_table(db)
  #
  # db.execute <<-SQL
  #    create table if not exists players (
  #    name varchar(50),
  #    email varchar(50),
  #    score integer,
  #    created_at datetime
  #    );
  #  SQL
  #
  #end 
