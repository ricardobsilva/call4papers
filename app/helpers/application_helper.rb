module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-danger',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash_messages = []
    flash.each do |msg_type, message|
      flash_messages << render(partial: 'flash_messages', locals: { msg_type: msg_type, message: message })
    end
    flash_messages.join('').html_safe
  end
end
