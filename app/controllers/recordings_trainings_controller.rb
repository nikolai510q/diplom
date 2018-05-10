class RecordingsTrainingsController < ApplicationController
	def new
		@recording = RecordingsTraining.new
	end

	def create
		@recording = RecordingsTraining.new(record_params)
		@recording.user = current_user
		if @recording.save
			redirect_to price_path, success: 'Запись успешно создана'
		else
			render :new
		end
	end

	private

  def record_params
    params.require(:recordings_training).permit(:type_training, :time_training, :trainer_name, :phone_number)
  end

end
