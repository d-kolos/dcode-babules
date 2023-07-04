module ApplicationHelper

  def favicon_name
    if Rails.env == 'development'
      favicon_name = 'favicon-dev.ico'
    elsif Rails.env == 'test'
      favicon_name = 'favicon-test.ico'
    elsif Rails.env == 'production'
      favicon_name = 'favicon-prod.ico'
    else
      favicon_name = 'favicon.ico'
    end
    favicon_name
  end

end
