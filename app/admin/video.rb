ActiveAdmin.register Video do
  form do |f|
    f.inputs do
      f.input :link
      f.input :title
      f.input :author
      f.input :tag_list
    end

    f.actions do
      f.action :submit, :as => :button
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :link, :title, :author, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
end
