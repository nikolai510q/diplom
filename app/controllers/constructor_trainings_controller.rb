class ConstructorTrainingsController < ApplicationController
  before_action :set_training
  def index
    @exercises = Exercise.all
  end

  def show
    @added_exercises = @training.exercises
  end

  def edit
    @initial_exercises = Exercise.where.not(id: @training.exercises_ids)
    @added_exercises = @training.exercises
  end

  def update
    @training.update(training_params)
    redirect_to :back
  end

  def add_exercise
    @training.exercises_ids << params[:exercise_id]
    @training.save
    @initial_exercises = Exercise.where.not(id: @training.exercises_ids)
    @added_exercises = @training.exercises
  end

  def remove_exercise
    @training.exercises_ids.delete(params[:exercise_id])
    @training.save
    @initial_exercises = Exercise.where.not(id: @training.exercises_ids)
    @added_exercises = @training.exercises
  end

  private
  def training_params
    params.require(:constructor_training).permit(:trainer_comment)
  end

  def set_training
    @training = ConstructorTraining.find_or_initialize_by(id: params[:id])
  end
end
