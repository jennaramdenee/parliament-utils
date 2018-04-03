Rails.application.config.after_initialize do
  ActionView::Base.sanitized_allowed_tags += %w(table thead tbody tfoot tr th td iframe)
  ActionView::Base.sanitized_allowed_attributes += %w(allowfullscreen seamless frameborder style)
end
