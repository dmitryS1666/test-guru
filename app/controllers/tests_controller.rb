class TestsController < ApplicationController

  before_action :authenticate_user!, expect: :index
  before_action :set_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)

    @test.set_questions_amount_to_cache

    if @test.timer
      current_user.test_passage(@test).set_timer_finish(@test.timer.minutes.from_now)
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
