ActiveAdmin.register ApplicationsTrainingProgram do
  menu priority: 5
  config.batch_actions = true
  actions :all, :except => [:show, :destroy]
  menu label: "Заказы"

  filter :user
  filter :created_at

  permit_params :user

  index do
    selectable_column
    id_column
    column :user

    column :created_at
    actions defaults: true do |applicatin|
      link_to "Конструктор", constructor_training_path(applicatin)
    end
  end


  form do |f|
    f.inputs do
      f.input :user

    end
    f.actions
  end


end
