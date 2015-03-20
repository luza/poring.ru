class Npc < ActiveRecord::Base
  self.table_name = 'info_npc'

  has_many :npc_items
  has_many :shops
  belongs_to :map

  def name?
    name.present? ? name : '<em>Безымянный</em>'.html_safe
  end

  def ptr_x
    (Map::IMAGE_X * x / map.map_size.width).round
  end

  def ptr_y
    (Map::IMAGE_Y - Map::IMAGE_Y * y / map.map_size.height).round
  end

  def npc_items
    super.where("type IN ('get', 'del')")
  end
end
