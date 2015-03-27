class ItemsController < ApplicationController
  def index
    @items = Item.order('title')
    @type_key = params[:type]
    @items = filter_type(@items, @type_key)
    @items, @filters = apply_filters(@items)
  end

  def view
    @item = Item.find(params[:id])
  end

  private
  def apply_filters(items)
    filters = params[:filters]

    if filters.nil?
      filters = session[:filters]
    end

    if filters.nil? || filters[:reset]
      initial_filters = {}
      filters = initial_filters
    end

    session[:filters] = filters

    if filled?(filters[:view])
      value = filters[:view].to_i
      items = items.where('view = ?', value)
    end

    if filled?(filters[:type])
      value = filters[:type].to_i
      if value.in?([1,512])
        # strict comparison for middle and lower
        items = items.where('loc = ?', value)
      else
        items = items.where('loc&?', value)
      end
    end

    if filled?(filters[:etc_type])
      value = filters[:etc_type].to_i
      if value == (1..7)
        items = items.where('view = ?', value)
      elsif value == 8 # pet taming items
        items = items.where("`use-script` LIKE '{ pet %; }'", value)
      elsif value == 9 # pet eggs
        items = items.where('type = 7')
      else # pet accessories
        items = items.where('type = 8')
      end
    end

    if filled?(filters[:class])
      adv, class_ = filters[:class].split(',')
      items = items.where(adv.to_i == 1 ? 'upper&2' : '(upper&1 OR upper&4)')
      items = items.where('job_dec&?', class_.to_i(16)) # from hex to dec
    end

    if filled?(filters[:min_level_val])
      comp = comp2sign(filters[:min_level_comp])
      value = filters[:min_level_val].to_i
      items = items.where("eLV #{comp} ?", value)
    end

    if filled?(filters[:attack_val])
      comp = comp2sign(filters[:attack_comp])
      value = filters[:attack_val].to_i
      items = items.where("atk #{comp} ?", value)
    end

    if filled?(filters[:def_val])
      comp = comp2sign(filters[:def_comp])
      value = filters[:def_val].to_i
      items = items.where("def #{comp} ?", value)
    end

    if filled?(filters[:range_val])
      comp = comp2sign(filters[:range_comp])
      value = filters[:range_val].to_i
      items = items.where("range #{comp} ?", value)
    end

    if filled?(filters[:weight_val])
      comp = comp2sign(filters[:weight_comp])
      value = filters[:weight_val].to_i
      items = items.where("weight/10 #{comp} ?", value)
    end

    if filled?(filters[:refinable])
      value = filters[:refinable] == 'yes' ? 1 : 0
      items = items.where('refinable = ?', value)
    end

    if filled?(filters[:weapon_level])
      value = filters[:weapon_level].to_i
      items = items.where('wLV = ?', value)
    end

    if filled?(filters[:slot])
      value = filters[:slot].to_i
      items = items.where('slot = ?', value)
    end

    if filled?(filters[:descr_contains])
      text = filters[:descr_contains]
      items = items.joins(:item_desc)
      items = items.where("(`use-script` LIKE '%#{text}%' OR " +
                              "`equip-script` LIKE '%#{text}%' OR " +
                              "`unequip-script` LIKE '%#{text}%' OR " +
                              "desc LIKE '%#{text}%')")
    end

    return items, filters
  end

  def filter_type(items, type_key)
    case type_key
      when 'cards'
        items.where('type = 6')
      when 'armor'
        items.where('type = 5')
      when 'weapon'
        items.where('type = 4')
      when 'usable'
        items.where("type IN (0, 2, 11, 18) AND `use-script` NOT LIKE '{ pet %; }'")
      when 'ext'
        items.where("type NOT IN (0, 2, 4, 5, 6, 11, 18) OR `use-script` LIKE '{ pet %; }'")
      else
        raise 'Incorrect type key'
    end
  end
end
