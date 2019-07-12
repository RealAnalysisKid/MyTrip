module PostsHelper
  def render_post_status(city, post)
    if post.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
