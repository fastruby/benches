# Bad
Post.select(:id).map(&:id)

# Good
Post.pluck(:id)
