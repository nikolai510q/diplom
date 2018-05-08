class ApplicationsTrainingProgramsController < ApplicationController
	def new
		@application_training = ApplicationsTrainingProgram.new
	end

	def create
		@application_training = ApplicationsTrainingProgram.new(application_training_params)
		if @application_training.save
			redirect_to price_path, notice: 'Запись успешно создана'
		else
			render :new
		end
	end

	def index
		@applications = ApplicationsTrainingProgram.all
	end

	private

  def application_training_params
    params.require(:recordings_training).permit!
  end

end
