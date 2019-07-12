module Admin::CitiesHelper
  def render_city_status(city)
    if city.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
