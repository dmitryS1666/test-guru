class QuestionsController < ApplicationController
  before_action :find_question_by_test, only: :index
  before_action :find_question_by_id, only: :show
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: "All questions: #{@questions.each { |question| question}}"
  end

  def show
    render plain: "Question number #{params[:id]}: #{@question[0].body}"
  end

  def new

  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  private
  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question_by_test
    @questions = Question.by_test_id(params[:test_id])
  end

  def find_question_by_id
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

end
