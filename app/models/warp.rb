class Warp < Common
  self.table_name = 'info_warp'

  belongs_to :map
  belongs_to :dest_map, class_name: 'Map', foreign_key: 'dest_map_id'

  def ptr_x
    (Map::IMAGE_X * x / map.map_size.width).round
  end

  def ptr_y
    (Map::IMAGE_Y - Map::IMAGE_Y * y / map.map_size.height).round
  end
end
