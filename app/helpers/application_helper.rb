module ApplicationHelper
  def handle_field(field)
    (field.blank?) ? "<sem dados>" : field
  end
end
