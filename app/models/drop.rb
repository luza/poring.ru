class Drop < Common
  self.table_name = 'info_drop'

  belongs_to :mob
  belongs_to :item
end
