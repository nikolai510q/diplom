ActiveAdmin.register Exercise do
  menu priority: 6
  config.batch_actions = true
  actions :all, :except => [:show, :destroy]
  menu label: "Упражнения"

  filter :exercise_name

  permit_params :exercise_name, :exercise_description

  index do
    id_column
    column :exercise_name
    column :exercise_description
    actions
  end

  form do |f|
    f.inputs do
      f.input :exercise_name
      f.input :exercise_description
    end
    f.actions
  end


end
