module ApplicationHelper

  # Error Helper for Form
  def show_errors(object, field_name)
    if object.errors.any? && object.errors.messages[field_name][0].present?
      "<label class='text-error'>" + object.errors.messages[field_name][0] + "</label>"
    else
      return ""
    end
  end

  # Flash Messages
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
  
end
