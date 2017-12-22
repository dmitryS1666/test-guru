module QuestionsHelper
  def question_header(test)
    if test.questions.last.new_record?
      "Create New #{test.title} Question"
    else
      "Edit #{test.title} Question"
    end
  end

end
