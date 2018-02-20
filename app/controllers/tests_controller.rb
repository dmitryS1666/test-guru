class TestsController < ApplicationController

  before_action :authenticate_user!, expect: :index
  before_action :set_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    test = current_user.test_passage(@test)
    redirect_to test

    @test.set_questions_amount_to_cache

    if @test.timer
      test.set_timer_finish
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
