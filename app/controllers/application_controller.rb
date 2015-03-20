class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def comp2sign(comp_string)
    case comp_string
      when 'eq' then
        '=='
      when 'gt' then
        '>'
      else
        '<'
    end
  end

  def filled?(obj)
    (obj.present? || obj.to_s == '0')
  end
end
