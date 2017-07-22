class BooleanHandler

  def self.convert( input )
    equivalents = { 
      "true" => true, 
      "t" => true,
      "false" => false, 
      "f" => false, 
    }
    string = input.to_s().downcase()
    return equivalents[ string ]
  end

end