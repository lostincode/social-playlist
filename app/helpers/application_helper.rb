module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Social Playlist").join(" - ")
      end
    end
  end
  def flash_class(level)
    case level
    when :notice then "success"
    when :error then "error"
    when :alert then "error"
    end
  end
end
