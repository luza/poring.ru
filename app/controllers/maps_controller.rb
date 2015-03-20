class MapsController < ApplicationController
  include MapsHelper

  def index
    @maps = Map.order('name')
    @maps, @filters = apply_filters(@maps)
  end

  def view
    @map = Map.find(params[:id])
    @map.hl_npc = params[:hl_npc].to_i
    if params[:x].present? && params[:y].present?
      @current_pos = {
          x: (Map::IMAGE_X * params[:x].to_i / @map.map_size.width).round,
          y: (Map::IMAGE_Y - Map::IMAGE_Y * params[:y].to_i / @map.map_size.height).round
      }
    end
  end

  private
  def apply_filters(maps)
    filters = params[:filters]
    initial_filters = {:has_mobs => 'yes'}

    if filters.nil? || filters[:reset].present?
      filters = initial_filters
    end

    if filled?(filters[:has_mobs])
      sign = filters[:has_mobs] == 'yes' ? '>' : '=';
      maps.joins(:spawns)
    end

    if filled?(filters[:has_npc])
      sign = filters[:has_npc] == 'yes' ? '>' : '=';
      maps.joins(:npcs)
    end

    return maps, filters
  end
end
