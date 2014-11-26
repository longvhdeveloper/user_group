module MeetingsHelper
  def no_meeting(meetings)
    content_tag('li', 'No Meetings') unless meetings.any?
  end

  def error_messages_for(object)

  end

  def flash_notice
    unless flash[:notice].blank?
      content_tag('div', h(flash[:notice]), {:id => "flash_notice"})
    end
  end
end
