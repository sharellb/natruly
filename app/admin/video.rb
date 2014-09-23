ActiveAdmin.register Video do
form    :html => { :multipart => true } do |f|
    f.inputs "Details" do
        f.input :link
        f.input :title
        f.input :author
        f.input :uid
        f.input :topics, :multiple => true, :collection => @topics
    end
    f.actions do
      f.action :submit, :as => :button
    end

end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
