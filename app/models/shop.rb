class Shop < ActiveRecord::Base
  self.table_name = 'info_shops'

  belongs_to :npc
  belongs_to :item
end
