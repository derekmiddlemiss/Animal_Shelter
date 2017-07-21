require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect( { dbname: 'shelter', host: 'localhost' } )
      db.prepare( "action", sql )
      result = db.exec_prepared( "action", values )
    ensure
      db.close()
    end
    return result
  end

end