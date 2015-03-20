class CommonController < ApplicationController
  def index
    @mob = Mob.find(1001)
  end

  def search
    query = params[:query]

    @results = {
        :items => search_items(query),
        :mobs => search_mobs(query),
        :maps => search_maps(query),
        :npcs => search_npcs(query)
    }

    render :layout => false
  end

  private
  def search_items(query)
    items = Item.order('title')
                .limit(100)
    if query.to_i > 0
      items.where('id = ?', query.to_i)
    else
      items.where('title LIKE ?', '%' + query + '%')
    end
  end

  def search_mobs(query)
    mobs = Mob.order('`j-name`')
               .limit(100)
    if query.to_i > 0
      mobs.where('id = ?', query.to_i)
    else
      mobs.where('`j-name` LIKE ?', '%' + query + '%')
    end
  end

  def search_maps(query)
    Map.where('name LIKE ?', '%' + query + '%')
        .order('name')
        .limit(100)
  end

  def search_npcs(query)
    Npc.joins(:map)
        .where('sprite > 0 AND sprite <> 111 AND info_maps.id > 0')
        .where('info_npc.name LIKE ?', '%' + query + '%')
        .order('info_npc.name')
        .limit(100)
  end
end
