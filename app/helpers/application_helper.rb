module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Social Playlist").join(" - ")
      end
    end
  end
end
