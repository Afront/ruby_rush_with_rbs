class MapLocationFinder
  # Get the index of the current map location.
  # This index corresponds to the 2D map array.
  def get_location_index(location)
    index = if location == 'Enumerable Canyon'
              0
            elsif location == 'Duck Type Beach'
              1
            elsif location == 'Monkey Patch City'
              2
            elsif location == 'Nil Town'
              3
            elsif location == 'Matzburg'
              4
            elsif location == 'Hash Crossing'
              5
            elsif location == 'Dynamic Palisades'
              6
            end
    index
  end
end
