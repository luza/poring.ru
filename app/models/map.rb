class Map < Common
  self.table_name = 'info_maps'

  has_many :warps
  has_many :spawns
  has_many :npcs
  has_one :map_size, foreign_key: 'name', primary_key: 'name'

  IMAGE_X = 384
  IMAGE_Y = 384

  # does the map have image
  def img?
    true
  end

  def hl_npc
    @hl_npc
  end

  def hl_npc=(hl_npc)
    @hl_npc = hl_npc
  end
end
