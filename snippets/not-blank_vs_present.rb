# Bad
return "yay" if !OBJECT.blank?

# Good
return "yay" if OBJECT.present?
