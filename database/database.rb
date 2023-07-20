class Database

  def self.instance
    @instance ||= SQLite3::Database.new('./database/database.db')
  end

  def self.execute(sql)
    instance.execute(sql)
  end
  
end 
