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
end
