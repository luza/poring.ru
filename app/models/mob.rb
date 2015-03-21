class Mob < ActiveRecord::Base
  self.table_name = 'info_mobs'

  has_many :drops
  has_many :spawns

  MD_CANMOVE            = 0x0001
  MD_LOOTER             = 0x0002
  MD_AGGRESSIVE         = 0x0004
  MD_ASSIST             = 0x0008
  MD_CASTSENSOR_IDLE    = 0x0010
  MD_BOSS               = 0x0020
  MD_PLANT              = 0x0040
  MD_CANATTACK          = 0x0080
  MD_DETECTOR           = 0x0100
  MD_CASTSENSOR_CHASE   = 0x0200
  MD_CHANGECHASE        = 0x0400
  MD_ANGRY              = 0x0800
  MD_CHANGETARGET_MELEE = 0x1000
  MD_CHANGETARGET_CHASE = 0x2000
  MD_TARGETWEAK         = 0x4000
  MD_RANDOMTARGET       = 0x8000

  # elements array
  ELEMENTS = {
      20 => [100, 100, 100, 100, 100, 100, 100, 100, 25, 100],
      21 => [100, 25, 100, 50, 175, 100, 100, 100, 100, 100],
      22 => [100, 100, 100, 150, 50, 125, 100, 100, 100, 100],
      23 => [100, 150, 50, 25, 100, 125, 100, 100, 100, 100],
      24 => [100, 50, 150, 100, 25, 125, 100, 100, 100, 100],
      25 => [100, 100, 100, 100, 100, 0, 100, 50, 100, 50],
      26 => [100, 75, 75, 75, 75, 75, 0, 125, 75, 100],
      27 => [100, 100, 100, 100, 100, 50, 125, 0, 75, 0],
      28 => [25, 100, 100, 100, 100, 100, 100, 100, 125, 100],
      29 => [100, 100, 100, 125, 100, -25, 150, -25, 100, 0],

      40 => [100, 100, 100, 100, 100, 100, 100, 100, 0, 100],
      41 => [100, 0, 100, 25, 175, 75, 100, 100, 75, 75],
      42 => [100, 100, 50, 175, 25, 125, 100, 100, 75, 75],
      43 => [100, 175, 25, 0, 100, 125, 100, 100, 75, 75],
      44 => [100, 25, 175, 100, 0, 125, 100, 100, 75, 75],
      45 => [100, 100, 100, 100, 100, 0, 100, 25, 75, 25],
      46 => [100, 50, 50, 50, 50, 50, -25, 150, 50, 125],
      47 => [100, 75, 75, 75, 75, 25, 150, -25, 50, 0],
      48 => [25, 100, 100, 100, 100, 75, 100, 100, 150, 100],
      49 => [100, 100, 100, 150, 100, -50, 175, -50, 125, 0],

      60 => [100, 100, 100, 100, 100, 100, 100, 100, 0, 100],
      61 => [100, -25, 100, 0, 200, 50, 100, 100, 50, 50],
      62 => [100, 100, 0, 200, 0, 100, 100, 100, 50, 50],
      63 => [100, 200, 0, -25, 100, 100, 100, 100, 50, 50],
      64 => [100, 0, 200, 100, -25, 100, 100, 100, 50, 50],
      65 => [100, 100, 100, 100, 100, 0, 125, 0, 50, 0],
      66 => [100, 25, 25, 25, 25, 25, -50, 175, 25, 150],
      67 => [100, 50, 50, 50, 50, 0, 175, -50, 25, 0],
      68 => [0, 100, 100, 100, 100, 50, 100, 100, 175, 100],
      69 => [100, 125, 75, 175, 100, -75, 200, -75, 150, 0],

      80 => [100, 100, 100, 100, 100, 100, 100, 100, 0, 100],
      81 => [100, -50, 100, 0, 200, 25, 75, 75, 25, 25],
      82 => [100, 100, -25, 200, 0, 75, 75, 75, 25, 25],
      83 => [100, 200, 0, -50, 100, 75, 75, 75, 25, 25],
      84 => [100, 0, 200, 100, -50, 75, 75, 75, 25, 25],
      85 => [100, 75, 75, 75, 75, 0, 125, -25, 25, -25],
      86 => [100, 0, 0, 0, 0, 0, -100, 200, 0, 175],
      87 => [100, 25, 25, 25, 25, -25, 200, -100, 0, 0],
      88 => [0, 100, 100, 100, 100, 25, 100, 100, 200, 100],
      89 => [100, 150, 50, 200, 100, -100, 200, -100, 175, 0],
  }

  def mode
    super.to_i(16)
  end

  def race_name
    case race
      when 0
        'Formless'
      when 1
        'Undead'
      when 2
        'Brute'
      when 3
        'Plant'
      when 4
        'Insect'
      when 5
        'Fish'
      when 6
        'Demon'
      when 7
        'DemiHuman'
      when 8
        'Angel'
      when 9
        'Dragon'
      when 10
        'Boss'
      when 11
        'Non-boss'
      else
        '?'
    end
  end

  def element_name
    case element % 10
      when 0
        'Neutral'
      when 1
        'Water'
      when 2
        'Earth'
      when 3
        'Fire'
      when 4
        'Wind'
      when 5
        'Poison'
      when 6
        'Holy'
      when 7
        'Dark'
      when 8
        'Ghost'
      when 9
        'Undead'
      else
        '&mdash;'.html_safe
    end
  end

  def element_level
    (element / 20).floor
  end

  def drops
    super.order('chance DESC')
  end

  def spawns
    super.order('count DESC')
  end

  def name
    read_attribute('j-name')
  end
end
