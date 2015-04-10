class Spawn < Common
  self.table_name = 'info_spawn'

  belongs_to :mob
  belongs_to :map

  # return integer if that is a whole number
  def min_time_mins
    val = (self['min-time']/1000.0/60.0)
    val.to_i == val ? val.to_i : val.round(1)
  end

  def max_time_mins
    val = (self['max-time']/1000.0/60.0).round(1)
    val.to_i == val ? val.to_i : val.round(1)
  end
end
