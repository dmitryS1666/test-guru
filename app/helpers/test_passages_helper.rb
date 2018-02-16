module TestPassagesHelper

  def result_output(test_passage)
    ratio = 100 * (test_passage.correct_questions.to_f / test_passage.test.questions.count)

    if ratio >= 85
      content_tag :h2 do
        concat content_tag :span, "#{ratio}% ", class: 'success'
        concat 'Test successfully passed!'
      end
    else
      content_tag :h2 do
        concat content_tag :span, "#{ratio}% ", class: 'fail'
        concat 'Test failed!'
      end
    end
  end

  def passing_question_info(test_passage)
    current_question = test_passage.test.questions.index(test_passage.current_question) + 1
    count_questions = test_passage.test.questions.count

    content_tag(:b, "#{current_question}/#{count_questions}")
  end

  def set_questions_amount_to_session(test_passage)
    test_id = "test_#{test_passage.test.id}"
    session[test_id.to_sym] ||= test_passage.test.questions.count
  end

  def current_question(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def ratio(test_passage)
    100 * (test_passage.correct_questions.to_f / test_passage.test.questions.count)
  end

end
