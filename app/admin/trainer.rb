ActiveAdmin.register Trainer do
  menu priority: 5
  config.batch_actions = true
  actions :all, :except => [:show, :destroy]
  menu label: "Тренеры"

  filter :fio

  permit_params :fio, :avatar

  index do
    selectable_column
    id_column
    column :fio
    column :avatar
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :fio
      f.input :avatar
    end
    f.actions
  end


end
