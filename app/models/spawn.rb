class Spawn < Common
  self.table_name = 'info_spawn'

  belongs_to :mob
  belongs_to :map

  def time
    if self['max-time'] == 0
      'Сразу'
    elsif self['min-time'] == self['max-time']
      delay.to_s + ' мин.'
    else
      delay.to_s + ' ~ ' + (delay + variance).to_s + ' мин.'
    end
  end

  private
  # return integer if that is a whole number
  def delay
    val = (self['min-time']/1000.0/60.0)
    val < 1 ? val.round(1) : val.round
  end

  def variance
    (self['max-time']/1000.0/60.0).round
  end
end
