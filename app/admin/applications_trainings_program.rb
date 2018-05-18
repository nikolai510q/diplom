ActiveAdmin.register ApplicationsTrainingProgram do
  menu priority: 5
  config.batch_actions = true
  actions :all, :except => [:edit, :new, :create, :destroy]
  menu label: "Заказы прог. тренировок"

  filter :user
  filter :created_at

  permit_params :user

  index do
    selectable_column
    id_column
    column :user
    column :weight
    column :growth
    column :age
    column :training_experiense
    column :training_per_week
    column :type_of_training
    column :physical_activity
    column :body_type
    column :training_weight_info
    column :user_wish
    column :created_at
    actions defaults: true do |applicatin|
      link_to "Конструктор", edit_constructor_training_path(applicatin)
    end
  end

end
