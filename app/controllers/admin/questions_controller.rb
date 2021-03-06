class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, except: [:index, :create, :new]

  def show; end

  def edit; end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to tests_path(@question.test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
