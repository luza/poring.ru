class Item < Common
  self.table_name = 'info_items'
  self.inheritance_column = ''

  has_one :item_desc, foreign_key: 'id'
  has_many :drops
  has_many :shops
  has_many :npc_items

  TYPE_NAMES = {
      :cards  => 'Карты',
      :armor  => 'Доспехи',
      :weapon => 'Оружие',
      :usable => 'Расходники',
      :ext    => 'Лут'
  }

  JB_NOVICE        = 0x00000001
  JB_SWORDMAN      = 0x00000002
  JB_MAGE          = 0x00000004
  JB_ARCHER        = 0x00000008
  JB_ACOLYTE       = 0x00000010
  JB_MERCHANT      = 0x00000020
  JB_THIEF         = 0x00000040
  JB_KNIGHT        = 0x00000080
  JB_PRIEST        = 0x00000100
  JB_WIZARD        = 0x00000200
  JB_BLACKSMITH    = 0x00000400
  JB_HUNTER        = 0x00000800
  JB_ASSASSIN      = 0x00001000
  JB_CRUSADER      = 0x00004000
  JB_MONK          = 0x00008000
  JB_SAGE          = 0x00010000
  JB_ROGUE         = 0x00020000
  JB_ALCHEMIST     = 0x00040000
  JB_BARD_DANCER   = 0x00080000
  JB_TAEKWON       = 0x00200000
  JB_STARGLADIATOR = 0x00400000
  JB_SOULLINKER    = 0x00800000
  JB_GUNSLINGER    = 0x01000000
  JB_NINJA         = 0x02000000

  JBA_SWORDMAN_CLASS = JB_SWORDMAN|JB_KNIGHT|JB_CRUSADER
  JBA_MAGE_CLASS = JB_MAGE|JB_WIZARD|JB_SAGE
  JBA_ARCHER_CLASS = JB_ARCHER|JB_HUNTER|JB_BARD_DANCER
  JBA_ACOLYTE_CLASS = JB_ACOLYTE|JB_PRIEST|JB_MONK
  JBA_MERCHANT_CLASS = JB_MERCHANT|JB_BLACKSMITH|JB_ALCHEMIST
  JBA_THIEF_CLASS = JB_THIEF|JB_ASSASSIN|JB_ROGUE
  JBA_TRANSCENDENT = JB_TAEKWON|JB_STARGLADIATOR|JB_SOULLINKER|JB_GUNSLINGER|JB_NINJA
  JBA_ALL_EXCEPT_NOVICE = JBA_SWORDMAN_CLASS|JBA_MAGE_CLASS|JBA_ARCHER_CLASS|JBA_ACOLYTE_CLASS|JBA_MERCHANT_CLASS|JBA_THIEF_CLASS|JBA_TRANSCENDENT
  JBA_ALL = JB_NOVICE|JBA_ALL_EXCEPT_NOVICE
  JBA_2ND_CLASS = JB_KNIGHT|JB_PRIEST|JB_WIZARD|JB_BLACKSMITH|JB_HUNTER|JB_ASSASSIN|JB_CRUSADER|JB_MONK|JB_SAGE|JB_ROGUE|JB_ALCHEMIST|JB_BARD_DANCER

  JOB_NAMES = {
      # aliases
      JBA_ALL => 'Все',
      JBA_ALL_EXCEPT_NOVICE => 'Все, кроме Novice',
      JBA_SWORDMAN_CLASS => 'Swordman Class',
      JBA_MAGE_CLASS => 'Mage Class',
      JBA_ARCHER_CLASS => 'Archer Class',
      JBA_ACOLYTE_CLASS => 'Acolyte Class',
      JBA_MERCHANT_CLASS => 'Merchant Class',
      JBA_THIEF_CLASS => 'Thief Class',
      JBA_2ND_CLASS => '2nd Classes',

      JB_NOVICE => 'Novice/Super Novice',
      JB_SWORDMAN => 'Swordman',
      JB_MAGE => 'Mage',
      JB_ARCHER => 'Archer',
      JB_ACOLYTE => 'Acolyte',
      JB_MERCHANT => 'Merchant',
      JB_THIEF => 'Thief',
      JB_KNIGHT => 'Knight',
      JB_PRIEST => 'Priest',
      JB_WIZARD => 'Wizard',
      JB_BLACKSMITH => 'Blacksmith',
      JB_HUNTER => 'Hunter',
      JB_ASSASSIN => 'Assassin',
      JB_CRUSADER => 'Crusader',
      JB_MONK => 'Monk',
      JB_SAGE => 'Sage',
      JB_ROGUE => 'Rogue',
      JB_ALCHEMIST => 'Alchemist',
      JB_BARD_DANCER => 'Bard/Dancer',
      JB_TAEKWON => 'Taekwon',
      JB_STARGLADIATOR => 'Star Gladiator',
      JB_SOULLINKER => 'Soul Linker',
      JB_GUNSLINGER => 'Gunslinger',
      JB_NINJA => 'Ninja'
  }

  def npc_items
    super.where("type IN ('get', 'del')")
  end

  def jobs
    jobs_mask = job
    job_list = []
    JOB_NAMES.each do |j, name|
      if (j&jobs_mask) == j
        if j == JB_BARD_DANCER && gender != 2
          name = gender ? 'Bard' : 'Dancer'
        end
        job_list.append(name)
        jobs_mask ^= j
      end
    end
    job_list.join(', ')
  end

  def job
    super.to_i
  end

  def name_with_slot
    slot > 0 ? "#{title} [#{slot}]" : title
  end

  def type_key
    case type
      when 6 then
        'cards'
      when 5 then
        'armor'
      when 4 then
        'weapon'
      when 0, 2, 11, 18 then
        'usable'
      else
        'ext'
    end
  end

  def type_name
    TYPE_NAMES[type_key.to_sym]
  end

  def drops
    super.order('chance DESC')
  end
end
