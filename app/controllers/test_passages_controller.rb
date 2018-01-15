class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: [:show, :update, :result]

  def show
    logger.info "@test_passage.current_question: #{@test_passage.current_question}"
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_url(@test_passage)
    else
      render :show
    end

  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
