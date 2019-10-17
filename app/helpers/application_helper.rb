module ApplicationHelper

  def login_helper style=nil
    if current_user.is_a?(GuestUser)
     (link_to "Register", new_user_registration_path, class: style) +
     " ".html_safe +
     (link_to "Login", new_user_session_path, class: style)
   else
     link_to "Logout", destroy_user_session_path, method: :delete, class: style
   end
  end

  def source_helper(layout_name)
    if session[:source]
    greeting = "Thanks for visiting from #{session[:source]} on layout: #{layout_name}"
    content_tag(:p, greeting, class: "source-greeting" )
    end
  end

  def copyright_generator
    @copyright = TejotaViewTool::Renderer.copyright "Terry Boyle", "All rights reserved"
  end

  def nav_active(page)
    if params[:action] == page
      "active"
    end
  end

end
