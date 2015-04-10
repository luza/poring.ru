class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :switch_database

  protected
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

  def renewal?
    (cookies[:is_renewal].to_i > 0)
  end

  private
  def switch_database
    spec = renewal? ? "#{Rails.env}_re" : Rails.env
    ActiveRecord::Base.establish_connection(spec)
  end
end
