#'plays.rb'
require 'sqlite3'
require 'singleton' #ensure only 1 instance of DB

#ALL THIS BELOW IS A BASIC ORM!!!

class PlayDBConnection < SQLite3::Database
	include Singleton
	
	def initialize
		super('plays.db')
		self.type_translation = true #type inserted into DB is the type we get back
		self.results_as_hash = true #we don't want results as array but as hash k-v pairs
	end
end

class Play
	attr_accessor :title, :year, :playwright_id
	
	def self.all #shows every entry in DB
		#Below: PlayDBConnection.instance is our pointer/handle to our DB.
		#Below: entire line evals to array of hashes, each hash a row in DB
		data = PlayDBConnection.instance.execute("SELECT * FROM plays")
		
		#But we desire not arr of hashes, but arr of Play instances. So:
		data.map{|datum| Play.new(datum)}
	end
	
	def initialize(options) #create new instance of Play class
		#assume options will come from Play::all where all cols defined,
		#or a user could create a Play instance, where everything but id defined.
		@id = options['id'] #either will be defined or nil
		@title = options['title']
		@year = options['year']
		@playwright_id = options['playwright_id']
	end
	
	def create #save new instances in DB
		#check for inclusion in DB first before adding.
		raise "#{self} already in database" if @id # i.e., if @id is not nil.
		
		#use a heredoc below to embed code that will be read as a string,
		#used so as not to have a long run-on string.
		#SQLite3 gem allows passing 'bind args' into heredoc,
		#So instance attributes can be referenced within in:
		PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
		--Here SQL and end tag SQL can be anything, as long as match.
		--Though choice of SQL is nice bc gives us syntax highlighting!
			INSERT INTO 
				plays (title, year, playwright_id)
			VALUES
				--? marks take in the bind args in the order passed.
				--Use this instead of just writing out i-vars because:
				--To protect against SQL Injection Attacks.
				(?, ?, ?)
				
				--Example of Injection Attack:
				--playwright_id = "3; DROP TABLE plays"
				--malicious user could include ; to signal end of DB operation
				--followed by DROP TABLE plays causing us lose all data,
				--and can guess our table name based on DB name (e.g. users)
				--by using 'bind arguments', SQLite3 gem will 'sanitize' them.
		SQL
		@id = PlayDBConnection.instance.last_insert_row_id
		#after creating it in DB, can finally get the id and save to our @id ivar.
	end
	
	def update #update existing instances of Play in DB
		#here opposite of check for #create:
		raise "#{self} not in database" unless @id
		PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
			UPDATE
				plays
			SET
				title = ?, year = ?, playwright_id = ?
			WHERE
				id = ?
		SQL
	end
end