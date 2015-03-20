class MapSize < ActiveRecord::Base
  self.table_name = 'info_mapsizes'
  self.primary_key = 'name'
end
