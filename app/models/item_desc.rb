class ItemDesc < Common
  self.table_name = 'info_itemsdesc'

  def desc
    replace_colors(super).gsub(/\n/, '<br />').html_safe
  end

  private
  def replace_colors(desc)
    desc.gsub(/\^[0-9A-F]{6}/i) do |m|
      m != '^000000' ? "<font color=\"#{m.gsub('^', '#')}\">" : '</font>'
    end
  end
end
