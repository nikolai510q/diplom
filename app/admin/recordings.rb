ActiveAdmin.register RecordingsTraining do
  before_action :skip_sidebar!
  actions :all, :except => [:new, :create, :destroy]
  menu label: "Тренировки"

  controller do
    def update
      recordings_training = RecordingsTraining.find(params[:id])
      RecordingsTrainingService.update(recordings_training, recording_params)
      redirect_to admin_recordings_training_url
    end

    def recording_params
      params.require(:recordings_training).permit!
    end
  end

  index do
    id_column
    column :user
    column :time_training
    column :type_training
    column :phone_number
    column :created_at
    column :updated_at
    column :approved
    column :trainer_name
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :trainer_id, :as => :select, :collection => Trainer.all.collect{|t| [t.fio, t.id]}
      f.input :time_training
      f.input :type_training
      f.input :phone_number
    end
  end
end
