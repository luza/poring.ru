class MobsController < ApplicationController
  include MobsHelper

  def index
    @mobs = Mob.order('`j-name`')
    @mobs, @filters = apply_filters(@mobs)
  end

  def view
    @mob = Mob.find(params[:id])
  end

  private
  def apply_filters(mobs)
    filters = params[:filters]
    initial_filters = { :qty_comp => 'gt', :qty_val => 0 }

    if filters.nil? || filters[:reset]
      filters = initial_filters
    end

    if filled?(filters[:level_val])
      comp = comp2sign(filters[:level_comp])
      value = filters[:level_val].to_i
      mobs = mobs.where("level #{comp} ?", value)
    end

    if filled?(filters[:race])
      value = filters[:race].to_i - 1
      mobs = mobs.where('race = ?', value)
    end

    if filled?(filters[:element])
      value = filters[:element].to_i - 1
      mobs = mobs.where('element % 10 = ?', value)
    end

    if filled?(filters[:element_lv])
      value = filters[:element_lv].to_i
      mobs = mobs.where('FLOOR(element / 20) = ?', value)
    end

    if filled?(filters[:size])
      value = filters[:size].to_i - 1
      mobs = mobs.where('scale = ?', value)
    end

    if filled?(filters[:bexp_val])
      comp = comp2sign(filters[:bexp_comp])
      value = filters[:bexp_val].to_i
      mobs = mobs.where("`base-exp` #{comp} ?", value)
    end

    if filled?(filters[:jexp_val])
      comp = comp2sign(filters[:jexp_comp])
      value = filters[:jexp_val].to_i
      mobs = mobs.where("`job-exp` #{comp} ?", value)
    end

    if filled?(filters[:hp_val])
      comp = comp2sign(filters[:hp_comp])
      value = filters[:hp_val].to_i
      mobs = mobs.where("hp #{comp} ?", value)
    end

    if filled?(filters[:attack_val])
      comp = comp2sign(filters[:attack_comp])
      value = filters[:attack_val].to_i
      mobs = case comp
               when '='
                 mobs.where('`min-atk` <= ? AND ? <= `max-atk`', value)
               when '<'
                 mobs.where('`max-atk` < ?', value)
               else
                 mobs.where('`min-atk` > ?', value)
             end
    end

    if filled?(filters[:def_val])
      comp = comp2sign(filters[:def_comp])
      value = filters[:def_val].to_i
      mobs = mobs.where("defence #{comp} ?", value)
    end

    if filled?(filters[:mdef_val])
      comp = comp2sign(filters[:mdef_comp])
      value = filters[:mdef_val].to_i
      mobs = mobs.where("`m-defence` #{comp} ?", value)
    end

    if filled?(filters[:str_val])
      comp = comp2sign(filters[:str_comp])
      value = filters[:str_val].to_i
      mobs = mobs.where("str #{comp} ?", value)
    end

    if filled?(filters[:dex_val])
      comp = comp2sign(filters[:dex_comp])
      value = filters[:dex_val].to_i
      mobs = mobs.where("dex #{comp} ?", value)
    end

    if filled?(filters[:vit_val])
      comp = comp2sign(filters[:vit_comp])
      value = filters[:vit_val].to_i
      mobs = mobs.where("vit #{comp} ?", value)
    end

    if filled?(filters[:agi_val])
      comp = comp2sign(filters[:agi_comp])
      value = filters[:agi_val].to_i
      mobs = mobs.where("agi #{comp} ?", value)
    end

    if filled?(filters[:int_val])
      comp = comp2sign(filters[:int_comp])
      value = filters[:int_val].to_i
      mobs = mobs.where("int #{comp} ?", value)
    end

    if filled?(filters[:luk_val])
      comp = comp2sign(filters[:luk_comp])
      value = filters[:luk_val].to_i
      mobs = mobs.where("luk #{comp} ?", value)
    end

    if filled?(filters[:is_moving])
      flag = filters[:is_moving] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&1 > 0) = ?', flag)
    end

    if filled?(filters[:is_attacking])
      flag = filters[:is_attacking] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&128 > 0) = ?', flag)
    end

    if filled?(filters[:is_agressive])
      flag = filters[:is_agressive] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&4 > 0) = ?', flag)
    end

    if filled?(filters[:is_assist])
      flag = filters[:is_assist] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&8 > 0) == ?', flag)
    end

    if filled?(filters[:is_detect_cast])
      flag = filters[:is_detect_cast] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&256 > 0) = ?', flag)
    end

    if filled?(filters[:is_boss])
      flag = filters[:is_boss] == 'yes' ? 1 : 0
      mobs = mobs.where('mode_dec&32 > 0) = ?', flag)
    end

    if filled?(filters[:qty_val])
      comp = comp2sign(filters[:qty_comp])
      value = filters[:qty_val].to_i
      mobs = mobs.where("qty #{comp} ?", value)
    end

    return mobs, filters
  end
end
