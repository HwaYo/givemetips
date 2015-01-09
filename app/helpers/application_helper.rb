module ApplicationHelper
  def fb_app_id
    if Rails.env.production?
      return "1519947921626205"
    else
      return "818776511527788"
    end
  end

  def og_title
    content_for(:og_title) || "Give me tips"
  end

  def og_description
    content_for(:og_description) || "나에게 조언을 줘!"
  end
end
