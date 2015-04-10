class NpcItem < Common
  self.table_name = 'info_npc_items'
  self.inheritance_column = ''

  belongs_to :npc
  belongs_to :item
end
