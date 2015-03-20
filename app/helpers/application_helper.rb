module ApplicationHelper
  def full_title(short_title)
    (short_title.empty? ? '' : short_title + ' | ') +
        'База предметов, монстров, локаций и НПЦ игры Рагнарок'
  end
end
