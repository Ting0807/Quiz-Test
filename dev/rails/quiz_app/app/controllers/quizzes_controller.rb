class QuizzesController < ApplicationController
  def index
  	@quizzes=Quiz.all
  end

  def show
  	@quiz=Quiz.find(params[:id])
  end

  def new
  	@quiz = Quiz.new
  	@quiz.questions.build
  end

  def create
  	# quiz = Quiz.create(params[:quiz].permit(:title))
  	@quiz=Quiz.new params[:quiz].permit(:title, questions_attributes: [:query])
  	# whu @quiz?
    if @quiz.save
       # redirect_to quiz
       redirect_to @quiz
     else 
     	render 'new'
     end
   end
end
