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

  def getUserFromEmail(email)
      email.split(/@/)[0]
  end

  def is_playlist_owner(playlist, &block)
    block.call if playlist.user == current_user
  end
end
