class Shop < ActiveRecord::Base
  
  def self.sql_distance( position)
    "6366 * acos( cos( radians( #{position[:latitude]})) * cos( radians( latitude)) * cos( radians( longitude) - radians( #{position[:longitude]})) + sin( radians( #{position[:latitude]})) * sin( radians( latitude)))"
  end
  
  # Distance en km
  def self.around( position, distance = 10)
    self.find_by_sql(" SELECT *, #{self.sql_distance( position)} AS distance  FROM  shops  HAVING  distance < #{distance} ORDER BY distance") #
  end
  def self.closest( position, limit = 10, distance = 50)
    self.find_by_sql(" SELECT *, #{self.sql_distance( position)} AS distance  FROM  shops  HAVING  distance < #{distance} ORDER BY distance LIMIT #{limit}") #
  end
end
