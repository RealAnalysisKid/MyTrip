module ApplicationHelper
  def render_city_status(city)
    if city.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-unlock")
    end
  end

  def render_post_status(city, post)
    if post.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-unlock")
    end
  end
end
