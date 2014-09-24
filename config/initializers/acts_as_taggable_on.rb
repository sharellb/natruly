ActsAsTaggableOn::Tag.class_eval do
  before_save { |tag| tag.slug = name.parameterize if name_changed? }

  def to_param
    gsub(' ', '-')
  end
end