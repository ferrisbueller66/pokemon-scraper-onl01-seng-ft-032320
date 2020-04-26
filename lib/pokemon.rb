require 'pry'

class Pokemon
<<<<<<< HEAD
  attr_accessor :name, :type, :db
  attr_reader :id
  
  
  def initialize(id:nil, name:, type:, db:)
=======
  attr_accessor :name, :type
  attr_reader :id, :db
  
  
  def initialize(id = nil, name, type, db)
>>>>>>> 260f653f8abb8d53ef8a26a6832684e8de8fdae1
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.create_table
    sql = "CREATE TABLE IF NOT EXISTS db(id INTEGER PRIMARY KEY, name TEXT, type TEXT);"
    db.execute(sql)
  end
  
<<<<<<< HEAD
  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end
  
  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
    id = results[0][0]
    name = results[0][1]
    type = results[0][2]
    db = results[0][3]
    
    pokemon = self.new(id: id, name: name, type: type, db: db)
  end
  
=======
  def self.save
      if self.id
      self.update
    else
      sql = "INSERT INTO pokemon(name, type) VALUES (?, ?);"
      db.execute(sql, "self.name", "self.type")
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
  end
  
  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    results = db.execute(sql, id)
    binding.pry
    results.map {|row| self.new_from_db(row)}.first
  end
  
  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    type = row[2]
    binding.pry
    self.new(id, name, type)
  end
  
    def update
      sql = "UPDATE self.db SET name = ?, type = ? WHERE id = ?;"
      db.execute(sql, self.name, self.type, self.id)
  end
  
  
>>>>>>> 260f653f8abb8d53ef8a26a6832684e8de8fdae1
end
