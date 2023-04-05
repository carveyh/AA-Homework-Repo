	   -- below created with DDL; is similar to what schema will be
	   CREATE TABLE plays (
		   -- when querying table plays, use this as prim key
		   id INTEGER PRIMARY KEY, 
		   title TEXT NOT NULL, -- so title is not optional when adding vals
		   year INTEGER NOT NULL,
		   playwright_id INTEGER NOT NULL,
		   FOREIGN KEY (playwright_id) REFERENCES playwrights(id)
	   );
	   CREATE TABLE playwrights (
		   id INTEGER PRIMARY KEY,
		   name TEXT NOT NULL,
		   birth_year INTEGER
	   );
	   
	   -- below data populated with DML
	   -- which table to populate first? Can't add to plays without a playwright_id,
	   -- so added to playwrights first
	   INSERT INTO
		   playwrights (name, birth_year)
	   VALUES
		   ('Arthur Miller', 1915),
		   ('Eugene O''Neill', 1888); -- SQL to escape a ', you need to do two ''
	   
	   INSERT INTO
		   plays (title, year, playwright_id)
	   VALUES
		   ('All My Sons', 1947, (SELECT id FROM playwrights WHERE name = 'Arthur Miller')),
		   ('Long Day''s Journey Into Night', 1956, (SELECT id FROM playwrights WHERE name = 'Eugene O''Neill'));