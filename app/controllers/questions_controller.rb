class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, except: [:index, :create, :new]

  def index
    @questions.to_a
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to root
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to tests_questions_path
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

end
