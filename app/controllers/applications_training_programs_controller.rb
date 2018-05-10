class ApplicationsTrainingProgramsController < ApplicationController
	def new
		@application_training = ApplicationsTrainingProgram.new
	end

	def create
		@application_training = ApplicationsTrainingProgram.new(application_training_params)
		@application_training.user = current_user
		# binding.pry
		if @application_training.save
			redirect_to root_path, notice: 'Заказ оформлен'
		else
			render :new
		end
	end

	def index
		@applications = ApplicationsTrainingProgram.all
	end

	private

  def application_training_params
    params.require(:applications_training_program).permit!
  end

end
